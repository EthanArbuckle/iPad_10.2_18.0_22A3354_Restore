@implementation ICDeviceAccessManager

- (ICDeviceAccessManager)init
{
  ICDeviceAccessManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *deviceAccessQueue;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  ICDeviceAccessManager *v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ICDeviceAccessManager;
  v2 = -[ICDeviceAccessManager init](&v18, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("ICDeviceAccessManagerQueue", 0);
    deviceAccessQueue = v2->_deviceAccessQueue;
    v2->_deviceAccessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_semaphore_create(0);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    -[ICDeviceAccessManager deviceAccessQueue](v2, "deviceAccessQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__ICDeviceAccessManager_init__block_invoke;
    block[3] = &unk_1E70C73E0;
    v2 = v2;
    v11 = v2;
    v13 = &v14;
    v7 = v5;
    v12 = v7;
    dispatch_async(v6, block);

    v8 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v7, v8);
    if (!*((_BYTE *)v15 + 24))
    {

      v2 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }
  return v2;
}

void __29__ICDeviceAccessManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  char *errmsg;
  uint64_t v11;

  objc_msgSend(CFSTR("/var/mobile/Library/com.apple.imagecapture"), "stringByAppendingPathComponent:", CFSTR("externalDeviceAccess.db"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/mobile/Library/com.apple.imagecapture"));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/com.apple.imagecapture"), 0, 0, &v11);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "openDB:", v2))
  {
    __ICOSLogCreate();
    v6 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(".."));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to open/create database"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
  }
  else
  {
    errmsg = 0;
    if (!sqlite3_exec((sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "externalMediaAccessDB"), "CREATE TABLE IF NOT EXISTS external_device_access (ID INTEGER PRIMARY KEY AUTOINCREMENT, bundle_id TEXT, date_added INTEGER, read_access INTEGER, write_access INTEGER, control_informed INTEGER)", 0, 0, &errmsg))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_14;
    }
    __ICOSLogCreate();
    v6 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".."));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create table: external_device_access - %s"), errmsg);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
  }

LABEL_14:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (int)openDB:(id)a3
{
  return sqlite3_open((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), &self->_externalMediaAccessDB);
}

- (void)dealloc
{
  __CFString *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (sqlite3_close(self->_externalMediaAccessDB))
  {
    __ICOSLogCreate();
    v3 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", CFSTR(".."));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to close database"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();

  }
  v6.receiver = self;
  v6.super_class = (Class)ICDeviceAccessManager;
  -[ICDeviceAccessManager dealloc](&v6, sel_dealloc);
}

+ (id)sharedAccessManager
{
  if (sharedAccessManager_onceToken != -1)
    dispatch_once(&sharedAccessManager_onceToken, &__block_literal_global_30);
  return (id)sharedAccessManager_mgr;
}

void __44__ICDeviceAccessManager_sharedAccessManager__block_invoke()
{
  ICDeviceAccessManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICDeviceAccessManager);
  v1 = (void *)sharedAccessManager_mgr;
  sharedAccessManager_mgr = (uint64_t)v0;

}

- (NSArray)bundleIdentifiersAccessingExternalCameras
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceAccessManager bundleIdentifiersWithAccessType:](self, "bundleIdentifiersWithAccessType:", CFSTR("read_access"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "objectForKeyedSubscript:", CFSTR("bundle_id"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)updateApplicationWithBundleIdentifier:(id)a3 withStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  NSObject *v29;
  uint64_t v30;
  _BYTE buf[24];
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[ICDeviceAccessManager bundleIdentifier:stateForAccessType:](self, "bundleIdentifier:stateForAccessType:", v6, CFSTR("write_access"));
  v8 = -[ICDeviceAccessManager bundleIdentifier:stateForAccessType:](self, "bundleIdentifier:stateForAccessType:", v6, CFSTR("read_access"));
  if (v7)
  {
    if (v4)
      v9 = 2;
    else
      v9 = 1;
    -[ICDeviceAccessManager updateBundleIdentifier:accessType:withState:](self, "updateBundleIdentifier:accessType:withState:", v6, CFSTR("write_access"), v9);
    __ICOSLogCreate();
    v10 = CFSTR("PrivacySettings");
    if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingString:", CFSTR(".."));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Setting (write) Access State %d"), v6, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:
      v10 = objc_retainAutorelease(v10);
      v15 = v13;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = -[__CFString UTF8String](v10, "UTF8String");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1B98FC000, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    __ICOSLogCreate();
    v10 = CFSTR("PrivacySettings");
    if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingString:", CFSTR(".."));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (write) Access State Unknown, not updating"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
  }

  if (v8)
  {
    if (v4)
      v16 = 2;
    else
      v16 = 1;
    -[ICDeviceAccessManager updateBundleIdentifier:accessType:withState:](self, "updateBundleIdentifier:accessType:withState:", v6, CFSTR("read_access"), v16);
    __ICOSLogCreate();
    v17 = CFSTR("PrivacySettings");
    if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingString:", CFSTR(".."));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Setting (read) Access State %d"), v6, v4, *(_OWORD *)buf, *(_QWORD *)&buf[16], v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:
      v17 = objc_retainAutorelease(v17);
      v22 = v20;
      v23 = -[__CFString UTF8String](v17, "UTF8String");
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v19;
      _os_log_impl(&dword_1B98FC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    __ICOSLogCreate();
    v17 = CFSTR("PrivacySettings");
    if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingString:", CFSTR(".."));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (read) Access State Unknown, not updating"), v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
  }

  __ICOSLogCreate();
  v24 = CFSTR("DEPRECATED");
  if ((unint64_t)objc_msgSend(CFSTR("DEPRECATED"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("DEPRECATED"), "substringWithRange:", 0, 18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAppendingString:", CFSTR(".."));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updateApplicationWithBundleIdentifier:%@ withStatus:%d"), v6, v4, *(_QWORD *)buf, *(_OWORD *)&buf[8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_retainAutorelease(v24);
    v29 = v27;
    v30 = -[__CFString UTF8String](v28, "UTF8String");
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v26;
    _os_log_impl(&dword_1B98FC000, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

- (NSArray)bundleIdentifiersAccessingExternalCamerasWithStatus
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  __CFString *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  NSObject *v57;
  uint64_t v58;
  ICDeviceAccessManager *v60;
  id v61;
  id obj;
  uint64_t v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  v60 = self;
  -[ICDeviceAccessManager bundleIdentifiersWithAccessType:](self, "bundleIdentifiersWithAccessType:", CFSTR("read_access"));
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v70 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("read_access"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "intValue");

        if (v9 == 1)
        {
          v10 = 0;
          goto LABEL_10;
        }
        if (v9 == 2)
        {
          v10 = 1;
LABEL_10:
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, CFSTR("whitelisted"));

          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundle_id"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, CFSTR("bundle_id"));

          objc_msgSend(v64, "addObject:", v11);
          __ICOSLogCreate();
          v14 = CFSTR("PrivacySettings");
          if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
          {
            objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringByAppendingString:", CFSTR(".."));
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundle_id"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ (read) Access State %d, adding"), v17, v10);
          v18 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v20 = objc_retainAutorelease(v14);
            v21 = v19;
            v22 = -[__CFString UTF8String](v20, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v75 = v22;
            v76 = 2114;
            v77 = v18;
            _os_log_impl(&dword_1B98FC000, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          goto LABEL_18;
        }
        __ICOSLogCreate();
        v11 = CFSTR("PrivacySettings");
        if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
        {
          objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByAppendingString:", CFSTR(".."));
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundle_id"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ (read) Access State Unknown, not adding"), v25);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_retainAutorelease(v11);
          v18 = v26;
          v27 = -[__CFString UTF8String](v11, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v75 = v27;
          v76 = 2114;
          v77 = v14;
          _os_log_impl(&dword_1B98FC000, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
LABEL_18:

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    }
    while (v4);
  }
  -[ICDeviceAccessManager bundleIdentifiersWithAccessType:](v60, "bundleIdentifiersWithAccessType:", CFSTR("write_access"));
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v61 = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (!v28)
    goto LABEL_41;
  v29 = v28;
  v63 = *(_QWORD *)v66;
  do
  {
    for (j = 0; j != v29; ++j)
    {
      if (*(_QWORD *)v66 != v63)
        objc_enumerationMutation(v61);
      v31 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("write_access"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "intValue");

      if (v33 == 1)
      {
        v34 = 0;
        goto LABEL_30;
      }
      if (v33 == 2)
      {
        v34 = 1;
LABEL_30:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v36, CFSTR("whitelisted"));

        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("bundle_id"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v37, CFSTR("bundle_id"));

        objc_msgSend(v64, "addObject:", v35);
        __ICOSLogCreate();
        v38 = CFSTR("PrivacySettings");
        if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
        {
          objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringByAppendingString:", CFSTR(".."));
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        v40 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("bundle_id"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("%@ (write) Access State %d, adding"), v41, v34);
        v42 = objc_claimAutoreleasedReturnValue();

        v43 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v44 = objc_retainAutorelease(v38);
          v45 = v43;
          v46 = -[__CFString UTF8String](v44, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v75 = v46;
          v76 = 2114;
          v77 = v42;
          _os_log_impl(&dword_1B98FC000, v45, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        goto LABEL_38;
      }
      __ICOSLogCreate();
      v35 = CFSTR("PrivacySettings");
      if ((unint64_t)objc_msgSend(CFSTR("PrivacySettings"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("PrivacySettings"), "substringWithRange:", 0, 18);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringByAppendingString:", CFSTR(".."));
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v48 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("bundle_id"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", CFSTR("%@ (write) Access State Unknown, not adding"), v49);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v50 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_retainAutorelease(v35);
        v42 = v50;
        v51 = -[__CFString UTF8String](v35, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v75 = v51;
        v76 = 2114;
        v77 = v38;
        _os_log_impl(&dword_1B98FC000, v42, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
LABEL_38:

      }
    }
    v29 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  }
  while (v29);
LABEL_41:
  __ICOSLogCreate();
  v52 = CFSTR("DEPRECATED");
  if ((unint64_t)objc_msgSend(CFSTR("DEPRECATED"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("DEPRECATED"), "substringWithRange:", 0, 18);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringByAppendingString:", CFSTR(".."));
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleIdentifiersAccessingExternalCamerasWithStatus: %@"), v64);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v56 = objc_retainAutorelease(v52);
    v57 = v55;
    v58 = -[__CFString UTF8String](v56, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v75 = v58;
    v76 = 2114;
    v77 = v54;
    _os_log_impl(&dword_1B98FC000, v57, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  return (NSArray *)v64;
}

- (NSArray)allBundleIdentifiers
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  dispatch_semaphore_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_semaphore_create(0);
  -[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ICDeviceAccessManager_allBundleIdentifiers__block_invoke;
  block[3] = &unk_1E70C79D8;
  v9 = v3;
  v10 = &v11;
  block[4] = self;
  v5 = v3;
  dispatch_async(v4, block);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

void __45__ICDeviceAccessManager_allBundleIdentifiers__block_invoke(uint64_t a1)
{
  const char *v2;
  void *v3;
  sqlite3 *v4;
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  char *errmsg;
  _QWORD v10[5];

  v2 = (const char *)objc_msgSend(CFSTR("SELECT bundle_id FROM external_device_access;"), "UTF8String");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__ICDeviceAccessManager_allBundleIdentifiers__block_invoke_2;
  v10[3] = &unk_1E70C79B0;
  v10[4] = *(_QWORD *)(a1 + 48);
  v3 = (void *)MEMORY[0x1BCCC74B4](v10);
  errmsg = 0;
  v4 = (sqlite3 *)objc_msgSend(*(id *)(a1 + 32), "externalMediaAccessDB");
  v5 = (id)MEMORY[0x1BCCC74B4](v3);
  LODWORD(v2) = sqlite3_exec(v4, v2, (int (__cdecl *)(void *, int, char **, char **))ICAcessQueryCompletion, v5, &errmsg);

  if ((_DWORD)v2)
  {
    __ICOSLogCreate();
    v6 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(".."));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), errmsg);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __45__ICDeviceAccessManager_allBundleIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", a2);
}

- (void)addBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD block[4];
  id v13;
  ICDeviceAccessManager *v14;
  dispatch_semaphore_t v15;

  v4 = a3;
  -[ICDeviceAccessManager allBundleIdentifiers](self, "allBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    __ICOSLogCreate();
    v6 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(".."));
      v6 = objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is already in the database, will not be added again"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();
  }
  else
  {
    v9 = dispatch_semaphore_create(0);
    -[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__ICDeviceAccessManager_addBundleIdentifier___block_invoke;
    block[3] = &unk_1E70C7630;
    v13 = v4;
    v14 = self;
    v15 = v9;
    v6 = v9;
    dispatch_async(v10, block);

    v11 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v6, v11);

    v8 = v13;
  }

}

void __45__ICDeviceAccessManager_addBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;
  sqlite3 *v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("INSERT INTO external_device_access(bundle_id,date_added,read_access,write_access,control_informed) VALUES ('%@',%lu,%lu,%lu,%lu);"),
    v3,
    (unint64_t)v4,
    0,
    0,
    0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "externalMediaAccessDB");
  v7 = objc_retainAutorelease(v5);
  sqlite3_exec(v6, (const char *)objc_msgSend(v7, "UTF8String"), 0, 0, 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)updateBundleIdentifier:(id)a3 accessType:(id)a4 withState:(unint64_t)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_time_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  ICDeviceAccessManager *v19;
  dispatch_semaphore_t v20;
  unint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = dispatch_semaphore_create(0);
  -[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ICDeviceAccessManager_updateBundleIdentifier_accessType_withState___block_invoke;
  block[3] = &unk_1E70C7A00;
  v20 = v10;
  v21 = a5;
  v17 = v9;
  v18 = v8;
  v19 = self;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, block);

  v15 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v12, v15);

}

void __69__ICDeviceAccessManager_updateBundleIdentifier_accessType_withState___block_invoke(uint64_t a1)
{
  void *v2;
  sqlite3 *v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char *errmsg;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE external_device_access SET %@ = %lu WHERE bundle_id = '%@';"),
    *(_QWORD *)(a1 + 32),
    *(_QWORD *)(a1 + 64),
    *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  errmsg = 0;
  v3 = (sqlite3 *)objc_msgSend(*(id *)(a1 + 48), "externalMediaAccessDB");
  v4 = objc_retainAutorelease(v2);
  if (sqlite3_exec(v3, (const char *)objc_msgSend(v4, "UTF8String"), 0, 0, &errmsg))
  {
    __ICOSLogCreate();
    v5 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), errmsg);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

- (id)bundleIdentifiersWithAccessType:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  ICDeviceAccessManager *v14;
  dispatch_semaphore_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_create(0);
  -[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__ICDeviceAccessManager_bundleIdentifiersWithAccessType___block_invoke;
  v12[3] = &unk_1E70C7A28;
  v13 = v4;
  v14 = self;
  v15 = v5;
  v16 = &v17;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, v12);

  v9 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v7, v9);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __57__ICDeviceAccessManager_bundleIdentifiersWithAccessType___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  const char *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char *errmsg;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT bundle_id, %@ FROM external_device_access;"),
    *(_QWORD *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "externalMediaAccessDB"), v4, (int (__cdecl *)(void *, int, char **, char **))ICAcessStatusQuery, v2, &errmsg))
  {
    __ICOSLogCreate();
    v5 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), errmsg);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (unint64_t)connection:(id)a3 stateForAccessType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFAllocator *v11;
  __SecTask *v12;
  __SecTask *v13;
  __CFString *v14;
  audit_token_t v16;
  __int128 v17;
  __int128 v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)xpc_connection_copy_entitlement_value();
  v9 = v8;
  if (v8 && xpc_BOOL_get_value(v8))
  {
    v10 = 2;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    xpc_connection_get_audit_token();
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    memset(&v16, 0, sizeof(v16));
    v12 = SecTaskCreateWithAuditToken(v11, &v16);
    if (v12)
    {
      v13 = v12;
      *(_QWORD *)v16.val = 0;
      v14 = (__CFString *)SecTaskCopySigningIdentifier(v12, (CFErrorRef *)&v16);
      CFRelease(v13);
    }
    else
    {
      v14 = 0;
    }
    v10 = -[ICDeviceAccessManager bundleIdentifier:stateForAccessType:](self, "bundleIdentifier:stateForAccessType:", v14, v7);

  }
  return v10;
}

- (unint64_t)bundleIdentifier:(id)a3 stateForAccessType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ICDeviceAccessManager validateBundleIdentifierInstalled:](self, "validateBundleIdentifierInstalled:", v6);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = v7;
  -[ICDeviceAccessManager bundleIdentifiersWithAccessType:](self, "bundleIdentifiersWithAccessType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bundle_id"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if (v16)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (int)objc_msgSend(v17, "intValue");

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)revokeBundleIdentifier:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v14;
  ICDeviceAccessManager *v15;
  dispatch_semaphore_t v16;

  v4 = a3;
  __ICOSLogCreate();
  v5 = CFSTR("icaccess");
  if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Revoking Application BundleID %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
    __29__ICDeviceAccessManager_init__block_invoke_cold_1();

  v8 = dispatch_semaphore_create(0);
  -[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ICDeviceAccessManager_revokeBundleIdentifier___block_invoke;
  block[3] = &unk_1E70C7630;
  v14 = v4;
  v15 = self;
  v16 = v8;
  v10 = v8;
  v11 = v4;
  dispatch_async(v9, block);

  v12 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v10, v12);

}

void __48__ICDeviceAccessManager_revokeBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  sqlite3 *v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char *errmsg;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM external_device_access WHERE bundle_id IS '%@';"),
    *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  errmsg = 0;
  v3 = (sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "externalMediaAccessDB");
  v4 = objc_retainAutorelease(v2);
  if (sqlite3_exec(v3, (const char *)objc_msgSend(v4, "UTF8String"), 0, 0, &errmsg))
  {
    __ICOSLogCreate();
    v5 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), errmsg);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (BOOL)validateBundleIdentifierInstalled:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  void *v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  BOOL v22;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _QWORD block[4];
  id v32;
  ICDeviceAccessManager *v33;
  NSObject *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  -[ICDeviceAccessManager deviceAccessQueue](self, "deviceAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICDeviceAccessManager_validateBundleIdentifierInstalled___block_invoke;
  block[3] = &unk_1E70C7A28;
  v6 = v3;
  v32 = v6;
  v33 = self;
  v35 = &v36;
  v7 = v4;
  v34 = v7;
  dispatch_async(v5, block);

  v8 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v7, v8);
  v30 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v30);
  v10 = v30;
  v24 = v10;
  if (v9 && !v10)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = (id)v37[5];
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v46, 16, v24);
    if (v12)
    {
      v13 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("bundle_id"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if ((v16 & 1) != 0)
          {

            v22 = 1;
            goto LABEL_19;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v46, 16);
        if (v12)
          continue;
        break;
      }
    }

  }
  __ICOSLogCreate();
  if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") < 0x15)
  {
    v18 = CFSTR("icaccess");
  }
  else
  {
    objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingString:", CFSTR(".."));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bundle was not found to be installed on the device, revoking access defensively to require the user to re-authorize upon install."), v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)_gICOSLog;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = -[__CFString UTF8String](objc_retainAutorelease(v18), "UTF8String");
    *(_DWORD *)buf = 136446466;
    v43 = v21;
    v44 = 2114;
    v45 = v19;
    _os_log_impl(&dword_1B98FC000, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  -[ICDeviceAccessManager revokeBundleIdentifier:](self, "revokeBundleIdentifier:", v6);
  v22 = 0;
LABEL_19:

  _Block_object_dispose(&v36, 8);
  return v22;
}

void __59__ICDeviceAccessManager_validateBundleIdentifierInstalled___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  const char *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char *errmsg;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT bundle_id FROM external_device_access WHERE bundle_id IS '%@';"),
    *(_QWORD *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "externalMediaAccessDB"), v4, (int (__cdecl *)(void *, int, char **, char **))ICAcessStatusQuery, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), &errmsg))
  {
    __ICOSLogCreate();
    v5 = CFSTR("icaccess");
    if ((unint64_t)objc_msgSend(CFSTR("icaccess"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("icaccess"), "substringWithRange:", 0, 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), errmsg);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      __29__ICDeviceAccessManager_init__block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)displayAlertForApplication:(id)a3 withNotification:(id)a4 completionBlock:(id)a5
{
  void (**v6)(id, uint64_t, CFOptionFlags);
  __CFUserNotification *v7;
  __CFUserNotification *v8;
  CFOptionFlags v9;
  SInt32 error;

  v6 = (void (**)(id, uint64_t, CFOptionFlags))a5;
  error = 0;
  v7 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, &error, (CFDictionaryRef)a4);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    CFUserNotificationReceiveResponse(v7, 0.0, &v9);
    v6[2](v6, 1, v9);
    CFRelease(v8);
  }

}

- (BOOL)captureUserIntentForBundleIdentifier:(id)a3 withNotification:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    +[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__ICDeviceAccessManager_captureUserIntentForBundleIdentifier_withNotification___block_invoke;
    v12[3] = &unk_1E70C7A50;
    v14 = &v15;
    v9 = v7;
    v13 = v9;
    objc_msgSend(v8, "displayAlertForApplication:withNotification:completionBlock:", v5, v6, v12);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v10 = *((_BYTE *)v16 + 24) != 0;
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

intptr_t __79__ICDeviceAccessManager_captureUserIntentForBundleIdentifier_withNotification___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (sqlite3)externalMediaAccessDB
{
  return self->_externalMediaAccessDB;
}

- (void)setExternalMediaAccessDB:(sqlite3 *)a3
{
  self->_externalMediaAccessDB = a3;
}

- (OS_dispatch_queue)deviceAccessQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceAccessQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAccessQueue, 0);
}

void __29__ICDeviceAccessManager_init__block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(v1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B98FC000, v2, v3, "%{public}20s ! %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

@end
