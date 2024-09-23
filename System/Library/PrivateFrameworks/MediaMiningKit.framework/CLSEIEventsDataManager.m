@implementation CLSEIEventsDataManager

- (CLSEIEventsDataManager)initWithDiskCacheURL:(id)a3
{
  id v5;
  CLSEIEventsDataManager *v6;
  CLSEIEventsDataManager *v7;
  uint64_t v8;
  NSMutableDictionary *venueCache;
  uint64_t v10;
  NSMutableDictionary *artistCache;
  uint64_t v12;
  NSMutableDictionary *categoryCache;
  dispatch_queue_t v14;
  OS_dispatch_queue *cacheQueue;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLSEIEventsDataManager;
  v6 = -[CLSEIEventsDataManager init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_diskCacheURL, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    venueCache = v7->_venueCache;
    v7->_venueCache = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    artistCache = v7->_artistCache;
    v7->_artistCache = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    categoryCache = v7->_categoryCache;
    v7->_categoryCache = (NSMutableDictionary *)v12;

    v14 = dispatch_queue_create("CacheQueue", 0);
    cacheQueue = v7->_cacheQueue;
    v7->_cacheQueue = (OS_dispatch_queue *)v14;

  }
  return v7;
}

- (id)managedObjectContext
{
  CLSEIEventsDataManager *v2;
  NSManagedObjectContext *managedObjectContext;
  NSManagedObjectContext *v4;
  void *v5;
  NSObject *v6;
  NSManagedObjectContext *v7;
  _QWORD v9[4];
  id v10;
  CLSEIEventsDataManager *v11;

  v2 = self;
  objc_sync_enter(v2);
  managedObjectContext = v2->_managedObjectContext;
  if (managedObjectContext)
  {
    v4 = managedObjectContext;
  }
  else
  {
    -[CLSEIEventsDataManager persistentStoreCoordinator](v2, "persistentStoreCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[CLSEIEventsDataManager cacheQueue](v2, "cacheQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __46__CLSEIEventsDataManager_managedObjectContext__block_invoke;
      v9[3] = &unk_1E84F7058;
      v10 = v5;
      v11 = v2;
      dispatch_sync(v6, v9);

    }
    v7 = v2->_managedObjectContext;
    if (!v7)
      __assert_rtn("-[CLSEIEventsDataManager managedObjectContext]", "CLSEIEventsDataManager.m", 73, "_managedObjectContext != nil");
    v4 = v7;

  }
  objc_sync_exit(v2);

  return v4;
}

- (NSManagedObjectModel)managedObjectModel
{
  CLSEIEventsDataManager *v2;
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectModel *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSManagedObjectModel *v10;
  void *v11;
  NSObject *v12;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  managedObjectModel = v2->_managedObjectModel;
  if (managedObjectModel)
  {
    v4 = managedObjectModel;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("CLSEIEventsData"), CFSTR("momd"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C97B98]);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "initWithContentsOfURL:", v8);
      v10 = v2->_managedObjectModel;
      v2->_managedObjectModel = (NSManagedObjectModel *)v9;

    }
    else
    {
      +[CLSEILogging sharedLogging](CLSEILogging, "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = CFSTR("CLSEIEventsData");
        _os_log_error_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_ERROR, "Failed to load a bundle containing \"%@\".", (uint8_t *)&v14, 0xCu);
      }

    }
    v4 = v2->_managedObjectModel;

  }
  objc_sync_exit(v2);

  return v4;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  CLSEIEventsDataManager *v2;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSPersistentStoreCoordinator *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSPersistentStoreCoordinator *v9;
  NSPersistentStoreCoordinator *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *p_super;
  void *v17;
  void *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  persistentStoreCoordinator = v2->_persistentStoreCoordinator;
  if (persistentStoreCoordinator)
  {
    v4 = persistentStoreCoordinator;
  }
  else
  {
    v5 = *MEMORY[0x1E0C97868];
    v24[0] = *MEMORY[0x1E0C978D0];
    v24[1] = v5;
    v25[0] = MEMORY[0x1E0C9AAB0];
    v25[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSEIEventsDataManager managedObjectModel](v2, "managedObjectModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v7);
      v9 = v2->_persistentStoreCoordinator;
      v2->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v8;

      v10 = v2->_persistentStoreCoordinator;
      -[CLSEIEventsDataManager diskCacheURL](v2, "diskCacheURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0C979E8];
      v21 = 0;
      -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v10, "addPersistentStoreWithType:configuration:URL:options:error:", v12, 0, v11, v6, &v21);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v21;

      if (v13)
      {
        +[CLSEILogging sharedLogging](CLSEILogging, "sharedLogging");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "loggingConnection");
        p_super = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAB79000, p_super, OS_LOG_TYPE_INFO, "Core Data database successfully cleared", buf, 2u);
        }
      }
      else
      {
        +[CLSEILogging sharedLogging](CLSEILogging, "sharedLogging");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "loggingConnection");
        v19 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v14;
          _os_log_error_impl(&dword_1CAB79000, v19, OS_LOG_TYPE_ERROR, "Cannot clear Core Data database: \"%@\", buf, 0xCu);
        }

        p_super = &v2->_persistentStoreCoordinator->super;
        v2->_persistentStoreCoordinator = 0;
      }

      v4 = v2->_persistentStoreCoordinator;
    }
    else
    {
      +[CLSEILogging sharedLogging](CLSEILogging, "sharedLogging");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loggingConnection");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CAB79000, v13, OS_LOG_TYPE_ERROR, "An error occured when we get the managedObjectModel", buf, 2u);
      }
      v14 = 0;
      v4 = 0;
    }

  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)_save
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CLSEIEventsDataManager managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v2, "save:", &v9);
  v4 = v9;

  if ((v3 & 1) == 0)
  {
    +[CLSEILogging sharedLogging](CLSEILogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_1CAB79000, v6, OS_LOG_TYPE_ERROR, "An error occured saving parent context to the database: \"%@\", buf, 0xCu);

    }
  }

  return 1;
}

- (BOOL)save
{
  CLSEIEventsDataManager *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[CLSEIEventsDataManager managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CLSEIEventsDataManager_save__block_invoke;
  v5[3] = &unk_1E84F7A70;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)clear
{
  CLSEIEventsDataManager *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  id v15;
  void *v16;
  NSObject *v17;
  CLSEIEventsDataManager *v18;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = *MEMORY[0x1E0C97868];
  v28[0] = *MEMORY[0x1E0C978D0];
  v28[1] = v3;
  v29[0] = MEMORY[0x1E0C9AAB0];
  v29[1] = MEMORY[0x1E0C9AAB0];
  v18 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSEIEventsDataManager persistentStoreCoordinator](v2, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "persistentStores");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v22;
      v11 = *MEMORY[0x1E0C979E8];
      obj = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "URL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v8;
          v14 = objc_msgSend(v6, "destroyPersistentStoreAtURL:withType:options:error:", v13, v11, v4, &v20);
          v15 = v20;

          v8 = v15;
          if ((v14 & 1) == 0)
          {
            +[CLSEILogging sharedLogging](CLSEILogging, "sharedLogging");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "loggingConnection");
            v17 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v8;
              _os_log_error_impl(&dword_1CAB79000, v17, OS_LOG_TYPE_ERROR, "Could not destroy persistent store for DBCache, %@", buf, 0xCu);
            }

          }
        }
        v7 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v9);
    }

    -[CLSEIEventsDataManager _resetCoreDataStack](v18, "_resetCoreDataStack");
  }
  else
  {
    v8 = 0;
  }

  objc_sync_exit(v18);
}

- (void)clearFastAccessCache
{
  uint64_t v2;
  NSMutableDictionary *categoryCache;
  uint64_t v4;
  NSMutableDictionary *venueCache;
  uint64_t v6;
  NSMutableDictionary *artistCache;
  CLSEIEventsDataManager *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  categoryCache = obj->_categoryCache;
  obj->_categoryCache = (NSMutableDictionary *)v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_claimAutoreleasedReturnValue();
  venueCache = obj->_venueCache;
  obj->_venueCache = (NSMutableDictionary *)v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = objc_claimAutoreleasedReturnValue();
  artistCache = obj->_artistCache;
  obj->_artistCache = (NSMutableDictionary *)v6;

  objc_sync_exit(obj);
}

- (void)_resetCoreDataStack
{
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  NSManagedObjectContext *managedObjectContext;
  CLSEIEventsDataManager *obj;

  obj = self;
  objc_sync_enter(obj);
  persistentStoreCoordinator = obj->_persistentStoreCoordinator;
  obj->_persistentStoreCoordinator = 0;

  managedObjectContext = obj->_managedObjectContext;
  obj->_managedObjectContext = 0;

  objc_sync_exit(obj);
}

- (id)insertVenueWithUUID:(int64_t)a3 name:(id)a4 coordinate:(CLLocationCoordinate2D)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[7];
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  int64_t v24;
  CLLocationDegrees v25;
  CLLocationDegrees v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__83;
  v35 = __Block_byref_object_dispose__84;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  -[CLSEIEventsDataManager managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__CLSEIEventsDataManager_insertVenueWithUUID_name_coordinate___block_invoke;
  v19[3] = &unk_1E84F7080;
  v22 = &v31;
  v23 = &v27;
  v19[4] = self;
  v24 = a3;
  v12 = v10;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v25 = latitude;
  v26 = longitude;
  objc_msgSend(v12, "performBlockAndWait:", v19);
  v14 = (void *)v32[5];
  if (!v14)
    __assert_rtn("-[CLSEIEventsDataManager insertVenueWithUUID:name:coordinate:]", "CLSEIEventsDataManager.m", 233, "venue != nil");
  if (*((_BYTE *)v28 + 24))
  {
    -[CLSEIEventsDataManager cacheQueue](self, "cacheQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __62__CLSEIEventsDataManager_insertVenueWithUUID_name_coordinate___block_invoke_2;
    block[3] = &unk_1E84F70A8;
    block[4] = self;
    block[5] = &v31;
    block[6] = a3;
    dispatch_sync(v15, block);

    v14 = (void *)v32[5];
  }
  v16 = v14;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

- (id)insertEventWithUUID:(int64_t)a3 name:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__83;
  v22 = __Block_byref_object_dispose__84;
  v23 = 0;
  -[CLSEIEventsDataManager managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__CLSEIEventsDataManager_insertEventWithUUID_name___block_invoke;
  v13[3] = &unk_1E84F79A0;
  v16 = &v18;
  v8 = v7;
  v14 = v8;
  v17 = a3;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v8, "performBlockAndWait:", v13);
  v10 = (void *)v19[5];
  if (!v10)
    __assert_rtn("-[CLSEIEventsDataManager insertEventWithUUID:name:]", "CLSEIEventsDataManager.m", 254, "event != nil");
  v11 = v10;

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)insertCategoryWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__83;
  v29 = __Block_byref_object_dispose__84;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[CLSEIEventsDataManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__CLSEIEventsDataManager_insertCategoryWithName___block_invoke;
  v16[3] = &unk_1E84F70D0;
  v19 = &v25;
  v16[4] = self;
  v7 = v4;
  v17 = v7;
  v20 = &v21;
  v8 = v5;
  v18 = v8;
  objc_msgSend(v8, "performBlockAndWait:", v16);
  v9 = (void *)v26[5];
  if (!v9)
    __assert_rtn("-[CLSEIEventsDataManager insertCategoryWithName:]", "CLSEIEventsDataManager.m", 274, "category != nil");
  if (*((_BYTE *)v22 + 24))
  {
    -[CLSEIEventsDataManager cacheQueue](self, "cacheQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __49__CLSEIEventsDataManager_insertCategoryWithName___block_invoke_2;
    v13[3] = &unk_1E84F79C8;
    v13[4] = self;
    v14 = v7;
    v15 = &v25;
    dispatch_sync(v10, v13);

    v9 = (void *)v26[5];
  }
  v11 = v9;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

- (id)insertArtistWithUUID:(int64_t)a3 name:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[7];
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__83;
  v30 = __Block_byref_object_dispose__84;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[CLSEIEventsDataManager managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__CLSEIEventsDataManager_insertArtistWithUUID_name___block_invoke;
  v16[3] = &unk_1E84F70F8;
  v19 = &v26;
  v20 = &v22;
  v16[4] = self;
  v21 = a3;
  v9 = v7;
  v17 = v9;
  v10 = v6;
  v18 = v10;
  objc_msgSend(v9, "performBlockAndWait:", v16);
  v11 = (void *)v27[5];
  if (!v11)
    __assert_rtn("-[CLSEIEventsDataManager insertArtistWithUUID:name:]", "CLSEIEventsDataManager.m", 301, "artist != nil");
  if (*((_BYTE *)v23 + 24))
  {
    -[CLSEIEventsDataManager cacheQueue](self, "cacheQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __52__CLSEIEventsDataManager_insertArtistWithUUID_name___block_invoke_2;
    block[3] = &unk_1E84F70A8;
    block[4] = self;
    block[5] = &v26;
    block[6] = a3;
    dispatch_sync(v12, block);

    v11 = (void *)v27[5];
  }
  v13 = v11;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (id)fetchEventForUUID:(int64_t)a3
{
  return -[CLSEIEventsDataManager _fetchManagedObjectWithEntityName:uuid:](self, "_fetchManagedObjectWithEntityName:uuid:", CFSTR("Event"), a3);
}

- (id)fetchVenueForUUID:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  _QWORD block[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__83;
  v25 = __Block_byref_object_dispose__84;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSEIEventsDataManager cacheQueue](self, "cacheQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CLSEIEventsDataManager_fetchVenueForUUID___block_invoke;
  block[3] = &unk_1E84F79C8;
  v20 = &v21;
  block[4] = self;
  v8 = v5;
  v19 = v8;
  dispatch_sync(v6, block);

  v9 = (void *)v22[5];
  if (!v9)
  {
    -[CLSEIEventsDataManager _fetchManagedObjectWithEntityName:uuid:](self, "_fetchManagedObjectWithEntityName:uuid:", CFSTR("Venue"), a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v22[5];
    v22[5] = v10;

    -[CLSEIEventsDataManager cacheQueue](self, "cacheQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __44__CLSEIEventsDataManager_fetchVenueForUUID___block_invoke_2;
    v15[3] = &unk_1E84F79C8;
    v15[4] = self;
    v16 = v8;
    v17 = &v21;
    dispatch_sync(v12, v15);

    v9 = (void *)v22[5];
  }
  v13 = v9;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (id)fetchArtistForUUID:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  _QWORD block[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__83;
  v25 = __Block_byref_object_dispose__84;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSEIEventsDataManager cacheQueue](self, "cacheQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CLSEIEventsDataManager_fetchArtistForUUID___block_invoke;
  block[3] = &unk_1E84F79C8;
  v20 = &v21;
  block[4] = self;
  v8 = v5;
  v19 = v8;
  dispatch_sync(v6, block);

  v9 = (void *)v22[5];
  if (!v9)
  {
    -[CLSEIEventsDataManager _fetchManagedObjectWithEntityName:uuid:](self, "_fetchManagedObjectWithEntityName:uuid:", CFSTR("Artist"), a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v22[5];
    v22[5] = v10;

    -[CLSEIEventsDataManager cacheQueue](self, "cacheQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __45__CLSEIEventsDataManager_fetchArtistForUUID___block_invoke_2;
    v15[3] = &unk_1E84F79C8;
    v15[4] = self;
    v16 = v8;
    v17 = &v21;
    dispatch_sync(v12, v15);

    v9 = (void *)v22[5];
  }
  v13 = v9;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (id)fetchCategoryForName:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__83;
  v24 = __Block_byref_object_dispose__84;
  v25 = 0;
  -[CLSEIEventsDataManager cacheQueue](self, "cacheQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CLSEIEventsDataManager_fetchCategoryForName___block_invoke;
  block[3] = &unk_1E84F79C8;
  v19 = &v20;
  block[4] = self;
  v7 = v4;
  v18 = v7;
  dispatch_sync(v5, block);

  v8 = (void *)v21[5];
  if (!v8)
  {
    -[CLSEIEventsDataManager _fetchManagedObjectWithEntityName:name:](self, "_fetchManagedObjectWithEntityName:name:", CFSTR("Category"), v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v21[5];
    v21[5] = v9;

    -[CLSEIEventsDataManager cacheQueue](self, "cacheQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __47__CLSEIEventsDataManager_fetchCategoryForName___block_invoke_2;
    v14[3] = &unk_1E84F79C8;
    v14[4] = self;
    v15 = v7;
    v16 = &v20;
    dispatch_sync(v11, v14);

    v8 = (void *)v21[5];
  }
  v12 = v8;

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (id)_fetchManagedObjectWithEntityName:(id)a3 uuid:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[CLSEIEventsDataManager managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %lu"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(v7, "executeFetchRequest:error:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_fetchManagedObjectWithEntityName:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[CLSEIEventsDataManager managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("name == %@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v8, "executeFetchRequest:error:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSURL)diskCacheURL
{
  return self->_diskCacheURL;
}

- (NSMutableDictionary)venueCache
{
  return self->_venueCache;
}

- (NSMutableDictionary)artistCache
{
  return self->_artistCache;
}

- (NSMutableDictionary)categoryCache
{
  return self->_categoryCache;
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_categoryCache, 0);
  objc_storeStrong((id *)&self->_artistCache, 0);
  objc_storeStrong((id *)&self->_venueCache, 0);
  objc_storeStrong((id *)&self->_diskCacheURL, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __47__CLSEIEventsDataManager_fetchCategoryForName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "categoryCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47__CLSEIEventsDataManager_fetchCategoryForName___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "categoryCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __45__CLSEIEventsDataManager_fetchArtistForUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "artistCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __45__CLSEIEventsDataManager_fetchArtistForUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "artistCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __44__CLSEIEventsDataManager_fetchVenueForUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "venueCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __44__CLSEIEventsDataManager_fetchVenueForUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "venueCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __52__CLSEIEventsDataManager_insertArtistWithUUID_name___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "fetchArtistForUUID:", *(_QWORD *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Artist"), *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setUuid:", *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setName:", *(_QWORD *)(a1 + 48));
  }
}

void __52__CLSEIEventsDataManager_insertArtistWithUUID_name___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "artistCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, v3);

}

void __49__CLSEIEventsDataManager_insertCategoryWithName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "fetchCategoryForName:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Category"), *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setName:", *(_QWORD *)(a1 + 40));
  }
}

void __49__CLSEIEventsDataManager_insertCategoryWithName___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "categoryCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

uint64_t __51__CLSEIEventsDataManager_insertEventWithUUID_name___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Event"), a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setUuid:", a1[7]);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setName:", a1[5]);
}

void __62__CLSEIEventsDataManager_insertVenueWithUUID_name_coordinate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "fetchVenueForUUID:", *(_QWORD *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("Venue"), *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setUuid:", *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setName:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLatitude:", *(double *)(a1 + 80));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLongitude:", *(double *)(a1 + 88));
  }
}

void __62__CLSEIEventsDataManager_insertVenueWithUUID_name_coordinate___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "venueCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, v3);

}

void __30__CLSEIEventsDataManager_save__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChanges");

  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_save");
}

void __46__CLSEIEventsDataManager_managedObjectContext__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  objc_msgSend(v2, "setUndoManager:", 0);
  objc_msgSend(v2, "setPersistentStoreCoordinator:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

@end
