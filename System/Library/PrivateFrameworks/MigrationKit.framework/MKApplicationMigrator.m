@implementation MKApplicationMigrator

- (MKApplicationMigrator)init
{
  MKApplicationMigrator *v2;
  MKApplicationMigrator *v3;
  MKApplicationDatabase *v4;
  MKApplicationDatabase *db;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKApplicationMigrator;
  v2 = -[MKMigrator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MKMigrator setType:](v2, "setType:", 2);
    v4 = objc_alloc_init(MKApplicationDatabase);
    db = v3->_db;
    v3->_db = v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[MKApplicationMigrator close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)MKApplicationMigrator;
  -[MKApplicationMigrator dealloc](&v3, sel_dealloc);
}

- (void)import
{
  MKApplicationMigrator *obj;
  objc_super v3;

  obj = self;
  objc_sync_enter(obj);
  if (-[NSMutableArray count](obj->_identifiers, "count"))
  {
    obj->_isImporting = 1;
    objc_sync_exit(obj);

  }
  else
  {
    objc_sync_exit(obj);

    v3.receiver = obj;
    v3.super_class = (Class)MKApplicationMigrator;
    -[MKMigrator import](&v3, sel_import);
  }
}

- (void)close
{
  MKApplicationDatabase *db;

  -[MKApplicationDatabase close](self->_db, "close");
  db = self->_db;
  self->_db = 0;

}

- (void)importDataEncodedInJSON:(id)a3
{
  MKApplicationMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKApplicationMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)import:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  unint64_t totalCount;
  unint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  MKApplicationMigrator *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[MKLog log](MKLog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_21EC08000, v5, OS_LOG_TYPE_INFO, "%@ will import applications.", buf, 0xCu);
  }

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    +[MKLog log](MKLog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MKApplicationMigrator import:].cold.2();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      if (-[NSObject count](v8, "count"))
      {
        v9 = -[NSObject mutableCopy](v8, "mutableCopy");
        -[MKApplicationMigrator setIdentifiers:](self, "setIdentifiers:", v9);

        self->_totalCount = -[NSMutableArray count](self->_identifiers, "count");
        -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v4, "length"));
        totalCount = self->_totalCount;
        if (totalCount % 0x32)
          v11 = totalCount / 0x32 + 1;
        else
          v11 = totalCount / 0x32;
        for (; v11; --v11)
        {
          -[MKMigrator delegate](self, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "migratorWillExecuteOperation:", self);

        }
        -[MKApplicationMigrator drainQueue](self, "drainQueue");
      }
    }
    else
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKApplicationMigrator import:].cold.1(v8);
    }
  }

}

- (void)drainQueue
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  unint64_t totalCount;
  unint64_t matchedAppsCount;
  MKApplicationAnalytics *v9;
  id v10;
  uint8_t buf[4];
  MKApplicationMigrator *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSMutableArray count](self->_identifiers, "count");
  if (v3 >= 0x32)
    v4 = 50;
  else
    v4 = v3;
  if (v4)
  {
    -[NSMutableArray subarrayWithRange:](self->_identifiers, "subarrayWithRange:", 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[MKApplicationMigrator lookup:](self, "lookup:");

  }
  else
  {
    v5 = self->_totalCount - self->_matchedAppsCount;
    +[MKLog log](MKLog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      totalCount = self->_totalCount;
      matchedAppsCount = self->_matchedAppsCount;
      *(_DWORD *)buf = 138413058;
      v12 = self;
      v13 = 2048;
      v14 = totalCount;
      v15 = 2048;
      v16 = matchedAppsCount;
      v17 = 2048;
      v18 = v5;
      _os_log_impl(&dword_21EC08000, v6, OS_LOG_TYPE_INFO, "%@ is done. total_count=%ld, matched_apps_count=%ld, not_matched_apps_count=%ld", buf, 0x2Au);
    }

    v9 = objc_alloc_init(MKApplicationAnalytics);
    -[MKApplicationAnalytics send:mismatchedApps:](v9, "send:mismatchedApps:", self->_matchedAppsCount, v5);

    if (self->_isImporting)
      -[MKApplicationMigrator import](self, "import");
  }
}

- (void)slice:(unint64_t)a3
{
  -[NSMutableArray removeObjectsInRange:](self->_identifiers, "removeObjectsInRange:", 0, a3);
  -[MKApplicationMigrator drainQueue](self, "drainQueue");
}

- (void)lookup:(id)a3
{
  id v4;
  MKAppSearchRequest *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(MKAppSearchRequest);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__MKApplicationMigrator_lookup___block_invoke;
  v7[3] = &unk_24E359128;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[MKAppSearchRequest search:androidIDs:completion:](v5, "search:androidIDs:completion:", 0, v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __32__MKApplicationMigrator_lookup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "didLookup:identifiers:error:", v7, *(_QWORD *)(a1 + 32), v6);

}

- (void)didLookup:(id)a3 identifiers:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MKApplicationMigrator *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  unint64_t lookupErrorCount;
  int v17;
  MKApplicationMigrator *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MKMigrator delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "migratorDidExecuteOperation:", self);

  v12 = self;
  v13 = objc_sync_enter(v12);
  v14 = (void *)MEMORY[0x2207B99F4](v13);
  +[MKLog log](MKLog, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v17 = 138412802;
    v18 = v12;
    v19 = 2048;
    v20 = objc_msgSend(v8, "count");
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_21EC08000, v15, OS_LOG_TYPE_INFO, "%@ did lookup android ids. apps=%ld, error=%@", (uint8_t *)&v17, 0x20u);
  }

  if (v10)
  {
    lookupErrorCount = v12->_lookupErrorCount;
    if (lookupErrorCount < 0xA)
    {
      v12->_lookupErrorCount = lookupErrorCount + 1;
      -[MKApplicationMigrator drainQueue](v12, "drainQueue");
    }
    else
    {
      -[MKApplicationDatabase addIdentifiers:](v12->_db, "addIdentifiers:", v9);
      -[MKMigrator migratorDidFailWithImportError:count:](v12, "migratorDidFailWithImportError:count:", v10, objc_msgSend(v9, "count"));
      -[MKApplicationMigrator slice:](v12, "slice:", objc_msgSend(v9, "count"));
    }
  }
  else
  {
    v12->_lookupErrorCount = 0;
    -[MKApplicationMigrator import:identifiers:](v12, "import:identifiers:", v8, v9);
  }
  objc_autoreleasePoolPop(v14);
  objc_sync_exit(v12);

}

- (void)import:(id)a3 identifiers:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  self->_matchedAppsCount += objc_msgSend(v7, "count");
  -[MKApplicationMigrator install:](self, "install:", v7);
  -[MKMigrator migratorDidImportWithCount:](self, "migratorDidImportWithCount:", objc_msgSend(v7, "count"));
  v8 = objc_msgSend(v6, "count");
  v9 = objc_msgSend(v7, "count");

  -[MKMigrator migratorDidFailWithImportError:count:](self, "migratorDidFailWithImportError:count:", 0, v8 - v9);
  v10 = objc_msgSend(v6, "count");

  -[MKApplicationMigrator slice:](self, "slice:", v10);
}

- (BOOL)importAndWait
{
  NSObject *v3;
  void *v4;
  MKApplicationDatabase *db;
  NSObject *v6;
  uint8_t v8[16];
  uint8_t buf[16];

  +[MKLog log](MKLog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "app installation will continue.", buf, 2u);
  }

  -[MKApplicationMigrator lookup](self, "lookup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKApplicationMigrator install:](self, "install:", v4);
  if (-[MKApplicationDatabase countForAppStoreIdentifiers](self->_db, "countForAppStoreIdentifiers") >= 1
    && -[MKApplicationMigrator prompt](self, "prompt"))
  {
    -[MKApplicationMigrator purchase](self, "purchase");
  }
  -[MKApplicationDatabase drop](self->_db, "drop");
  -[MKApplicationDatabase close](self->_db, "close");
  db = self->_db;
  self->_db = 0;

  +[MKLog log](MKLog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21EC08000, v6, OS_LOG_TYPE_INFO, "app installation is done.", v8, 2u);
  }

  return 1;
}

- (id)lookup
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  uint64_t v9;
  MKAppSearchRequest *v10;
  NSObject *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  -[MKApplicationDatabase identifiers](self->_db, "identifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  v4 = v3;
  if (v3 >= 50)
    v5 = 50;
  else
    v5 = v3;
  objc_msgSend(v2, "subarrayWithRange:", 0, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_semaphore_create(0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  v8 = 0;
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = MEMORY[0x24BDAC760];
  while (objc_msgSend(v6, "count"))
  {
    v10 = objc_alloc_init(MKAppSearchRequest);
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __31__MKApplicationMigrator_lookup__block_invoke;
    v18[3] = &unk_24E359410;
    v20 = &v33;
    v21 = &v29;
    v22 = &v23;
    v11 = v7;
    v19 = v11;
    -[MKAppSearchRequest search:androidIDs:completion:](v10, "search:androidIDs:completion:", 0, v6, v18);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    v12 = v30;
    v13 = v34;
    if (v30[3] < 10)
    {
      if (*((_BYTE *)v34 + 24))
        goto LABEL_13;
    }
    else
    {
      *((_BYTE *)v34 + 24) = 0;
    }
    *((_BYTE *)v13 + 24) = 0;
    v12[3] = 0;
    v8 += v5;
    v4 -= v5;
    if (v4 >= 50)
      v5 = 50;
    else
      v5 = v4;
    objc_msgSend(v17, "subarrayWithRange:", v8, v5);
    v14 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v14;
LABEL_13:

  }
  v15 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

void __31__MKApplicationMigrator_lookup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __31__MKApplicationMigrator_lookup__block_invoke_cold_1(v6);

  }
  if (objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v5);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)install:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSDictionary *signatures;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MKPlaceholder *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  MKPlaceholder *v29;
  MKApplicationDatabase *db;
  void *v31;
  __int128 v32;
  id obj;
  MKApplicationMigrator *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
  if (v4)
  {
    v6 = v4;
    v35 = *(_QWORD *)v37;
    *(_QWORD *)&v5 = 138413570;
    v32 = v5;
    v34 = self;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v37 != v35)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
        +[MKLog log](MKLog, "log", v32);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appStoreIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "developer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "iconURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v8, "isFree");
          *(_DWORD *)buf = v32;
          v41 = v10;
          v42 = 2112;
          v43 = v11;
          v44 = 2112;
          v45 = v12;
          v46 = 2112;
          v47 = v13;
          v48 = 2112;
          v49 = v14;
          v50 = 1024;
          v51 = v15;
          _os_log_impl(&dword_21EC08000, v9, OS_LOG_TYPE_INFO, "will install an application. bundle_id=%@, appstore_id=%@, name=%@, developer=%@, icon=%@, free=%d", buf, 0x3Au);

          self = v34;
        }

        if (objc_msgSend(v8, "isFree"))
        {
          signatures = self->_signatures;
          objc_msgSend(v8, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKey:](signatures, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v19 = (void *)MEMORY[0x24BDBCE50];
            v20 = (void *)MEMORY[0x24BDBCF48];
            objc_msgSend(v8, "iconURL");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "URLWithString:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "dataWithContentsOfURL:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = [MKPlaceholder alloc];
            objc_msgSend(v8, "bundleIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "appStoreIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "developer");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[MKPlaceholder initWithBundleIdentifier:appStoreIdentifier:bundleName:developer:icon:](v24, "initWithBundleIdentifier:appStoreIdentifier:bundleName:developer:icon:", v25, v26, v27, v28, v23);

            self = v34;
            -[MKPlaceholder install](v29, "install");

          }
          db = self->_db;
          objc_msgSend(v8, "appStoreIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKApplicationDatabase addAppStoreIdentifier:](db, "addAppStoreIdentifier:", v31);

        }
        ++v7;
      }
      while (v6 != v7);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    }
    while (v6);
  }

}

- (BOOL)prompt
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v11[4];
  dispatch_semaphore_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[3];
  CFUserNotificationRef v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_semaphore_create(0);
  v21[0] = *MEMORY[0x24BDBD6D8];
  MKLocalizedString(CFSTR("APP_MIGRATION_PROMPT_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v21[1] = *MEMORY[0x24BDBD6E0];
  MKLocalizedString(CFSTR("APP_MIGRATION_PROMPT_MESSAGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v4;
  v21[2] = *MEMORY[0x24BDBD6F8];
  MKLocalizedString(CFSTR("APP_MIGRATION_PROMPT_CHOICE_YES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v5;
  v21[3] = *MEMORY[0x24BDBD6F0];
  MKLocalizedString(CFSTR("APP_MIGRATION_PROMPT_CHOICE_NO"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v20 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, v7);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  dispatch_get_global_queue(25, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __31__MKApplicationMigrator_prompt__block_invoke;
  v11[3] = &unk_24E359438;
  v13 = v19;
  v14 = &v15;
  v12 = v2;
  v9 = v2;
  dispatch_async(v8, v11);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v2) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  return (char)v2;
}

intptr_t __31__MKApplicationMigrator_prompt__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = responseFlags == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)purchase
{
  dispatch_semaphore_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t *v12;
  uint64_t *v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[4];
  NSObject *v23;
  __int128 *p_buf;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = dispatch_semaphore_create(0);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[MKApplicationDatabase appStoreIdentifiers](self->_db, "appStoreIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = *MEMORY[0x24BEB2700];
  *(_QWORD *)&v7 = 138412290;
  v19 = v7;
  while (v5 < objc_msgSend(v4, "count", v19))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = v19;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_21EC08000, v9, OS_LOG_TYPE_INFO, "will lookup a store item. id=%@", (uint8_t *)&buf, 0xCu);
    }

    v10 = objc_alloc_init(MEMORY[0x24BEB1E68]);
    objc_msgSend(v10, "setValue:forParameter:", v8, v6);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __33__MKApplicationMigrator_purchase__block_invoke;
    v25[3] = &unk_24E359410;
    v27 = &v40;
    v28 = &v36;
    v29 = &v30;
    v11 = v3;
    v26 = v11;
    objc_msgSend(v10, "startWithItemLookupBlock:", v25);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    v12 = v37;
    v13 = v41;
    if (v37[3] < 10)
    {
      if (*((_BYTE *)v41 + 24))
        goto LABEL_9;
    }
    else
    {
      *((_BYTE *)v41 + 24) = 0;
    }
    *((_BYTE *)v13 + 24) = 0;
    v12[3] = 0;
    ++v5;
LABEL_9:

  }
  +[MKLog log](MKLog, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21EC08000, v14, OS_LOG_TYPE_INFO, "will create a store purchase request.", (uint8_t *)&buf, 2u);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__1;
  v47 = __Block_byref_object_dispose__1;
  v15 = objc_alloc(MEMORY[0x24BEB1F88]);
  v48 = (id)objc_msgSend(v15, "initWithPurchases:", v31[5]);
  v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v17 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __33__MKApplicationMigrator_purchase__block_invoke_26;
  v22[3] = &unk_24E359460;
  p_buf = &buf;
  v23 = v3;
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __33__MKApplicationMigrator_purchase__block_invoke_28;
  v20[3] = &unk_24E359488;
  v18 = v23;
  v21 = v18;
  objc_msgSend(v16, "startWithPurchaseResponseBlock:completionBlock:", v22, v20);
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

}

void __33__MKApplicationMigrator_purchase__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    +[MKLog log](MKLog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __33__MKApplicationMigrator_purchase__block_invoke_cold_1(v6);

  }
  if (v5 && objc_msgSend(v5, "count") == 1)
  {
    v8 = objc_alloc(MEMORY[0x24BEB1F78]);
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithItem:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v10);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __33__MKApplicationMigrator_purchase__block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB24A0]) & 1) != 0)
  {
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "code");

    if (v7 == 16)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __33__MKApplicationMigrator_purchase__block_invoke_26_cold_1(v3);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancel");
    }
  }
  else
  {

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t __33__MKApplicationMigrator_purchase__block_invoke_28(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSDictionary)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(id)a3
{
  objc_storeStrong((id *)&self->_signatures, a3);
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)import:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "MKApplicationMigrator could not initialize because an invalid json format was received.", v1, 2u);
}

- (void)import:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_21EC08000, v0, OS_LOG_TYPE_ERROR, "MKApplicationMigrator could not initialize because an underlying error occurred unexpectedly. error=%@", v1, 0xCu);
}

void __31__MKApplicationMigrator_lookup__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_21EC08000, v2, v3, "could not lookup applications and will retry. error=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __33__MKApplicationMigrator_purchase__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_21EC08000, v2, v3, "could not lookup store items and will retry. error=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __33__MKApplicationMigrator_purchase__block_invoke_26_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_21EC08000, v2, v3, "store purchase request was canceled. error=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
