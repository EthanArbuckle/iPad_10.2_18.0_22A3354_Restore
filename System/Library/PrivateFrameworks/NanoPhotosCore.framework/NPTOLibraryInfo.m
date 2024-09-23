@implementation NPTOLibraryInfo

- (NPTOLibraryInfo)initWithDevice:(id)a3
{
  id v4;
  NPTOLibraryInfo *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *libraryURL;
  NPTONotificationCenter *v12;
  NPTONotificationCenter *notificationCenter;
  NPTOPreferencesAccessor *v14;
  NPTOPreferencesAccessor *legacyPreferencesAccessor;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NPTOLibraryInfo;
  v5 = -[NPTOLibraryInfo init](&v17, sel_init);
  if (v5)
  {
    nanophotos_log_sync_oversize();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_21387D000, v6, OS_LOG_TYPE_DEFAULT, "Creating library info for device: %@", buf, 0xCu);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE6B378]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("NanoPhotos"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    libraryURL = v5->_libraryURL;
    v5->_libraryURL = (NSURL *)v10;

    v12 = (NPTONotificationCenter *)-[NPTONotificationCenter initWithDevice:]([NPTONotificationCenter alloc], v4);
    notificationCenter = v5->_notificationCenter;
    v5->_notificationCenter = v12;

    v14 = -[NPTOPreferencesAccessor initWithDevice:]([NPTOPreferencesAccessor alloc], "initWithDevice:", v4);
    legacyPreferencesAccessor = v5->_legacyPreferencesAccessor;
    v5->_legacyPreferencesAccessor = v14;

  }
  return v5;
}

- (NSDate)lastUpdatedDate
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  id v6;
  NSObject *v7;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[NPTOLibraryInfo _collectionTargetMapFileURL]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v3 = *MEMORY[0x24BDBCBE0];
  v9 = 0;
  v4 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v10, v3, &v9);
  v5 = v10;
  v6 = v9;

  if ((v4 & 1) == 0)
  {
    nanophotos_log_sync();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_21387D000, v7, OS_LOG_TYPE_ERROR, "Failed to read modification date for library collection target map due to %@", buf, 0xCu);
    }

  }
  return (NSDate *)v5;
}

- (id)_collectionTargetMapFileURL
{
  if (a1)
  {
    objc_msgSend(a1[1], "URLByAppendingPathComponent:", CFSTR("collectionTargetMap"));
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)isSyncing
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTOLibraryInfo _syncingFileURL]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  return v6;
}

- (id)_syncingFileURL
{
  if (a1)
  {
    objc_msgSend(a1[1], "URLByAppendingPathComponent:", CFSTR("syncing"));
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setSyncing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  if (-[NPTOLibraryInfo isSyncing](self, "isSyncing") != a3)
  {
    if (v3)
    {
      -[NPTOLibraryInfo _createLibraryDirectoryIfNeeded]((uint64_t)self);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTOLibraryInfo _syncingFileURL]((id *)&self->super.isa);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "createFileAtPath:contents:attributes:", v7, 0, 0);

      if ((v8 & 1) == 0)
      {
        nanophotos_log_sync();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_21387D000, v9, OS_LOG_TYPE_ERROR, "Failed to create syncing file.", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTOLibraryInfo _syncNeededFileURL]((id *)&self->super.isa);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v13 = objc_msgSend(v10, "removeItemAtPath:error:", v12, &v22);
      v14 = v22;

      if ((v13 & 1) != 0)
        goto LABEL_13;
      nanophotos_log_sync();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      v16 = "Failed to remove syncneeded file: %@";
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTOLibraryInfo _syncingFileURL]((id *)&self->super.isa);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v20 = objc_msgSend(v17, "removeItemAtPath:error:", v19, &v21);
      v14 = v21;

      if ((v20 & 1) != 0)
      {
LABEL_13:

        -[NPTONotificationCenter postNotificationName:]((uint64_t)self->_notificationCenter, CFSTR("com.apple.NanoPhotos.Syncing.changed"));
        goto LABEL_14;
      }
      nanophotos_log_sync();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      v16 = "Failed to remove syncing file: %@";
    }
    _os_log_error_impl(&dword_21387D000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
    goto LABEL_12;
  }
LABEL_14:
  -[NPTOPreferencesAccessor removeObjectForKey:](self->_legacyPreferencesAccessor, "removeObjectForKey:", CFSTR("IsSyncing"));
  -[NPTOPreferencesAccessor removeObjectForKey:](self->_legacyPreferencesAccessor, "removeObjectForKey:", CFSTR("Syncing"));
}

- (void)_createLibraryDirectoryIfNeeded
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "path");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 8);
      v10 = 0;
      v7 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v10);
      v8 = v10;

      if ((v7 & 1) == 0)
      {
        nanophotos_log_sync();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v8;
          _os_log_error_impl(&dword_21387D000, v9, OS_LOG_TYPE_ERROR, "Failed to create library directory: %@", buf, 0xCu);
        }

      }
    }

  }
}

- (id)_syncNeededFileURL
{
  if (a1)
  {
    objc_msgSend(a1[1], "URLByAppendingPathComponent:", CFSTR("syncneeded"));
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)syncingChangeObserverWithQueue:(id)a3 block:(id)a4
{
  return -[NPTONotificationCenter observerForName:queue:block:]((NPTODarwinNotificationObserver *)self->_notificationCenter, CFSTR("com.apple.NanoPhotos.Syncing.changed"), a3, a4);
}

- (NSDictionary)collectionTargetMap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCE50];
  -[NPTOLibraryInfo _collectionTargetMapFileURL]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_msgSend(MEMORY[0x24BDBCE70], "classForKeyedUnarchiver");
  v8 = objc_msgSend(MEMORY[0x24BDBCE30], "classForKeyedUnarchiver");
  v9 = objc_msgSend(MEMORY[0x24BDD1880], "classForKeyedUnarchiver");
  v10 = objc_msgSend(MEMORY[0x24BDD17C8], "classForKeyedUnarchiver");
  v11 = objc_msgSend(MEMORY[0x24BDD16E0], "classForKeyedUnarchiver");
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_msgSend(MEMORY[0x24BDBCE50], "classForKeyedUnarchiver"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v12, v4, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;

  if (v14)
  {
    nanophotos_log_sync();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = v14;
      _os_log_error_impl(&dword_21387D000, v15, OS_LOG_TYPE_ERROR, "Failed to unarchive library collection target map data %@, error: %@", buf, 0x16u);
    }

  }
  return (NSDictionary *)v13;
}

- (void)setCollectionTargetMap:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5
    || (-[NPTOLibraryInfo collectionTargetMap](self, "collectionTargetMap"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[NPTOLibraryInfo collectionTargetMap](self, "collectionTargetMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v5)
    {
      if ((v7 & 1) == 0)
      {
        v21 = 0;
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v21);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = v21;
        if (v9)
        {
          nanophotos_log_sync();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v23 = v5;
            v24 = 2112;
            v25 = v9;
            _os_log_error_impl(&dword_21387D000, v10, OS_LOG_TYPE_ERROR, "Failed to archive library collection target map %@, error: %@", buf, 0x16u);
          }

        }
        -[NPTOLibraryInfo _createLibraryDirectoryIfNeeded]((uint64_t)self);
        -[NPTOLibraryInfo _collectionTargetMapFileURL]((id *)&self->super.isa);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v12 = -[NSObject writeToURL:options:error:](v8, "writeToURL:options:error:", v11, 1, &v20);
        v13 = v20;

        if ((v12 & 1) == 0)
        {
          nanophotos_log_sync();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v13;
            _os_log_error_impl(&dword_21387D000, v14, OS_LOG_TYPE_ERROR, "Failed to write collection target map file: %@", buf, 0xCu);
          }

        }
        goto LABEL_18;
      }
    }
    else
    {

      if ((v7 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTOLibraryInfo _collectionTargetMapFileURL]((id *)&self->super.isa);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        v18 = objc_msgSend(v15, "removeItemAtPath:error:", v17, &v19);
        v9 = v19;

        if ((v18 & 1) != 0)
        {
LABEL_19:

          -[NPTONotificationCenter postNotificationName:]((uint64_t)self->_notificationCenter, CFSTR("com.apple.NanoPhotos.Library.changed"));
          goto LABEL_20;
        }
        nanophotos_log_sync();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v9;
          _os_log_error_impl(&dword_21387D000, v8, OS_LOG_TYPE_ERROR, "Failed to remove collection target map file: %@", buf, 0xCu);
        }
LABEL_18:

        goto LABEL_19;
      }
    }
  }
LABEL_20:
  -[NPTOPreferencesAccessor removeObjectForKey:](self->_legacyPreferencesAccessor, "removeObjectForKey:", CFSTR("ExpectedLibrarySize"));
  -[NPTOPreferencesAccessor removeObjectForKey:](self->_legacyPreferencesAccessor, "removeObjectForKey:", CFSTR("NumberOfPhotos"));
  -[NPTOPreferencesAccessor removeObjectForKey:](self->_legacyPreferencesAccessor, "removeObjectForKey:", CFSTR("WatchCollectionList"));
  -[NPTOPreferencesAccessor removeObjectForKey:](self->_legacyPreferencesAccessor, "removeObjectForKey:", CFSTR("LibraryCollectionTargetMapData"));

}

- (id)collectionTargetMapChangeObserverWithQueue:(id)a3 block:(id)a4
{
  return -[NPTONotificationCenter observerForName:queue:block:]((NPTODarwinNotificationObserver *)self->_notificationCenter, CFSTR("com.apple.NanoPhotos.Library.changed"), a3, a4);
}

- (BOOL)isSyncNeeded
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTOLibraryInfo _syncNeededFileURL]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  return v6;
}

- (void)setSyncNeeded
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint8_t v8[16];

  -[NPTOLibraryInfo _createLibraryDirectoryIfNeeded]((uint64_t)self);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTOLibraryInfo _syncNeededFileURL]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v5, 0, 0);

  if ((v6 & 1) == 0)
  {
    nanophotos_log_sync();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_21387D000, v7, OS_LOG_TYPE_ERROR, "Failed to create syncneeded file.", v8, 2u);
    }

  }
  -[NPTONotificationCenter postNotificationName:]((uint64_t)self->_notificationCenter, CFSTR("com.apple.NanoPhotos.SyncNeeded.changed"));
}

- (id)syncNeededChangeObserverWithQueue:(id)a3 block:(id)a4
{
  return -[NPTONotificationCenter observerForName:queue:block:]((NPTODarwinNotificationObserver *)self->_notificationCenter, CFSTR("com.apple.NanoPhotos.SyncNeeded.changed"), a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyPreferencesAccessor, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

@end
