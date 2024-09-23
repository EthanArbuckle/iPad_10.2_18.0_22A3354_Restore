@implementation MKBookmarkMigrator

- (MKBookmarkMigrator)init
{
  MKBookmarkMigrator *v2;
  MKBookmarkMigrator *v3;
  uint64_t v4;
  WebBookmarkCollection *collection;
  uint64_t v6;
  NSMutableDictionary *rootFolder;
  MKBookmarkMigrator *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MKBookmarkMigrator;
  v2 = -[MKMigrator init](&v25, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_5;
  -[MKMigrator setType:](v2, "setType:", 3);
  if (!objc_msgSend(MEMORY[0x24BEC2730], "lockSync"))
  {
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MKBookmarkMigrator init].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BEC2730], "safariBookmarkCollection");
  v4 = objc_claimAutoreleasedReturnValue();
  collection = v3->_collection;
  v3->_collection = (WebBookmarkCollection *)v4;

  if (!v3->_collection)
  {
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MKBookmarkMigrator init].cold.1(v9, v17, v18, v19, v20, v21, v22, v23);
LABEL_10:

    v8 = 0;
    goto LABEL_11;
  }
  -[MKBookmarkMigrator _createRootBookmarkFolder](v3, "_createRootBookmarkFolder");
  v6 = objc_claimAutoreleasedReturnValue();
  rootFolder = v3->_rootFolder;
  v3->_rootFolder = (NSMutableDictionary *)v6;

LABEL_5:
  v8 = v3;
LABEL_11:

  return v8;
}

- (void)importDataEncodedInJSON:(id)a3
{
  MKBookmarkMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKBookmarkMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)import:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  MKBookmark *v7;
  MKBookmark *v8;
  void *v9;
  void *v10;
  void *v11;
  WebBookmarkCollection *collection;
  NSMutableDictionary *rootFolder;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint8_t v27[16];
  uint8_t v28[8];
  id v29;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKLog log](MKLog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC08000, v6, OS_LOG_TYPE_INFO, "will import a bookmark.", buf, 2u);
  }

  if (!objc_msgSend(v4, "length"))
  {
    collection = self->_collection;
    rootFolder = self->_rootFolder;
    v29 = 0;
    -[WebBookmarkCollection mergeWithBookmarksDictionary:clearHidden:error:](collection, "mergeWithBookmarksDictionary:clearHidden:error:", rootFolder, 0, &v29);
    v14 = v29;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BEC2730], "unlockSync");
      goto LABEL_14;
    }
    v15 = v14;
    +[MKLog log](MKLog, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MKGETStatusRouter server:didReceiveRequest:response:].cold.1((uint64_t)v15, v16);
LABEL_12:

    -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v15);
    goto LABEL_15;
  }
  v7 = -[MKBookmark initWithData:]([MKBookmark alloc], "initWithData:", v4);
  if (!v7)
  {
    +[MKLog log](MKLog, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_21EC08000, v16, OS_LOG_TYPE_INFO, "bookmark is missing.", v28, 2u);
    }
    v15 = 0;
    goto LABEL_12;
  }
  v8 = v7;
  -[MKBookmarkMigrator _bookmarkFolderAtTitlePath:withinRootFolder:](self, "_bookmarkFolderAtTitlePath:withinRootFolder:", &stru_24E35A3B8, self->_rootFolder);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Children"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKBookmark data](v8, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

LABEL_14:
  -[MKMigrator migratorDidImport](self, "migratorDidImport");
  -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v4, "length"));
  v15 = 0;
LABEL_15:
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v17);
  objc_msgSend(v17, "payload");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bookmarks");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceDate:", v5);
  v22 = v21;

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v22);
  objc_msgSend(v19, "importElapsedTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "decimalNumberByAdding:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setImportElapsedTime:", v25);

  objc_sync_exit(v17);
  +[MKLog log](MKLog, "log");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_21EC08000, v26, OS_LOG_TYPE_INFO, "did import a bookmark.", v27, 2u);
  }

}

- (id)_createRootBookmarkFolder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MKBookmarkMigrator _createBookmarkFolderWithTitle:UUID:](self, "_createBookmarkFolderWithTitle:UUID:", 0, CFSTR("Root"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKBookmarkMigrator _createBookmarkFolderWithTitle:UUID:](self, "_createBookmarkFolderWithTitle:UUID:", CFSTR("BookmarksBar"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v7);
  return v3;
}

- (id)_createBookmarkFolderWithTitle:(id)a3 UUID:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", 4);
  objc_msgSend(v8, "setObject:forKey:", CFSTR("WebBookmarkTypeList"), CFSTR("WebBookmarkType"));
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("WebBookmarkUUID"));

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("Children"));

  if (v5)
    objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("Title"));

  return v8;
}

- (id)_bookmarkFolderAtTitlePath:(id)a3 withinRootFolder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Children"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "pathComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKBookmarkMigrator _bookmarkFolderAtTitlePath:withinBookmarkFolder:](self, "_bookmarkFolderAtTitlePath:withinBookmarkFolder:", v9, v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  return v8;
}

- (id)_bookmarkFolderAtTitlePath:(id)a3 withinBookmarkFolder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  MKBookmarkMigrator *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MKBookmarkMigrator *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v24 = self;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Children"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Title"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v8, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v18 = v14;

      v17 = v24;
      if (v18)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

      v17 = v24;
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKBookmarkMigrator _createBookmarkFolderWithTitle:UUID:](v17, "_createBookmarkFolderWithTitle:UUID:", v8, v20);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v18);
LABEL_13:
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKBookmarkMigrator _bookmarkFolderAtTitlePath:withinBookmarkFolder:](v17, "_bookmarkFolderAtTitlePath:withinBookmarkFolder:", v21, v18);
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v22;
    }
    v7 = v25;

  }
  else
  {
    v18 = v7;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_21EC08000, a1, a3, "WebBookmarkCollection lockSync was failed.", a5, a6, a7, a8, 0);
}

@end
