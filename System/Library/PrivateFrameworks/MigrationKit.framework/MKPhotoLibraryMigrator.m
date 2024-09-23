@implementation MKPhotoLibraryMigrator

- (MKPhotoLibraryMigrator)initWithType:(unint64_t)a3
{
  return -[MKPhotoLibraryMigrator initWithType:reuseDatabase:](self, "initWithType:reuseDatabase:", a3, 0);
}

- (MKPhotoLibraryMigrator)initWithType:(unint64_t)a3 reuseDatabase:(BOOL)a4
{
  MKPhotoLibraryMigrator *v4;
  _BOOL8 v5;
  MKPhotoLibraryMigrator *v7;
  MKPhotoLibraryMigrator *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *assetQueue;
  MKPhotoLibrary *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  MKPhotoLibrary *photoLibrary;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *root;
  MKPhotoLibraryAssetDatabase *v20;
  MKPhotoLibraryAssetDatabase *db;
  objc_super v23;

  if (a3 == 2)
  {
    v4 = 0;
  }
  else
  {
    v5 = a4;
    v23.receiver = self;
    v23.super_class = (Class)MKPhotoLibraryMigrator;
    v7 = -[MKMigrator init](&v23, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_isBusy = 0;
      v9 = dispatch_queue_create("com.apple.migrationkit.migrator.photolibrary.asset", 0);
      assetQueue = v8->_assetQueue;
      v8->_assetQueue = (OS_dispatch_queue *)v9;

      v11 = [MKPhotoLibrary alloc];
      if (a3)
        v12 = CFSTR("video");
      else
        v12 = CFSTR("image");
      if (a3)
        v13 = 12;
      else
        v13 = 11;
      v14 = -[MKPhotoLibrary initWithContentType:](v11, "initWithContentType:", a3 != 0);
      photoLibrary = v8->_photoLibrary;
      v8->_photoLibrary = (MKPhotoLibrary *)v14;

      NSHomeDirectory();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("/Library/MigrationKit/"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "stringByAppendingPathComponent:", v12);
      v18 = objc_claimAutoreleasedReturnValue();
      root = v8->_root;
      v8->_root = (NSString *)v18;

      v20 = -[MKPhotoLibraryAssetDatabase initWithType:reuse:]([MKPhotoLibraryAssetDatabase alloc], "initWithType:reuse:", a3, v5);
      db = v8->_db;
      v8->_db = v20;

      v8->_type = a3;
      -[MKMigrator setType:](v8, "setType:", v13);

    }
    self = v8;
    v4 = self;
  }

  return v4;
}

- (void)importChunk:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 collection:(id)a9 originalFilename:(id)a10 complete:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  MKPhotoLibraryMigrator *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = self;
  v22 = objc_sync_enter(v21);
  v23 = (void *)MEMORY[0x2207B99F4](v22);
  LOBYTE(v24) = a11;
  -[MKPhotoLibraryMigrator import:identifier:offset:length:total:filename:collection:originalFilename:complete:](v21, "import:identifier:offset:length:total:filename:collection:originalFilename:complete:", v25, v17, a5, a6, a7, v18, v19, v20, v24);
  objc_autoreleasePoolPop(v23);
  objc_sync_exit(v21);

}

- (void)import:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 collection:(id)a9 originalFilename:(id)a10 complete:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  NSObject *v24;
  NSString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  unint64_t v31;
  NSObject *v32;
  void *v33;
  MKPhotoLibraryAsset *v34;
  MKPhotoLibraryAsset *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  BOOL v43;
  BOOL v44;
  NSObject *v45;
  _BOOL4 v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  id v50;
  unint64_t v51;
  void *v52;
  unint64_t v53;
  NSString *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint8_t buf[4];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (objc_msgSend(v18, "length") && objc_msgSend(v19, "length"))
  {
    v55 = a5;
    v56 = v17;
    objc_msgSend(v20, "lowercaseString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("camera"));

    v53 = a6;
    if (v23)
    {

      v20 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = self->_root;
    objc_msgSend(v18, "lastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "substringWithRange:", 0, 1);
    v27 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v27;
    v54 = v25;
    -[NSString stringByAppendingPathComponent:](v25, "stringByAppendingPathComponent:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingPathComponent:", v19);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    if ((objc_msgSend(v58, "fileExistsAtPath:", v29) & 1) == 0)
    {
      v61 = 0;
      objc_msgSend(v58, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0, &v61);
      v30 = v61;
      if (v30)
      {
        v57 = v30;
        v31 = a7;
        +[MKLog log](MKLog, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[MKFileMigrator import:filename:offset:length:total:complete:].cold.4();

        a7 = v31;
      }
      else
      {
        v57 = 0;
      }
    }
    if (v55)
    {
      v51 = a7;
      v60 = 0;
      objc_msgSend(v58, "attributesOfItemAtPath:error:", v59, &v60);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (MKPhotoLibraryAsset *)v60;
      if (v34)
      {
        v35 = v34;
        v36 = v29;
        +[MKLog log](MKLog, "log");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[MKFileMigrator import:filename:offset:length:total:complete:].cold.3();

        v29 = v36;
LABEL_40:

        goto LABEL_41;
      }
      v50 = v21;
      objc_msgSend(v33, "objectForKey:", *MEMORY[0x24BDD0D08]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "unsignedLongLongValue");

      if (v39 == v55)
      {
        v49 = v33;
        objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v59);
        v40 = objc_claimAutoreleasedReturnValue();
        -[NSObject seekToEndOfFile](v40, "seekToEndOfFile");
        -[NSObject writeData:](v40, "writeData:", v56);
        -[NSObject synchronizeFile](v40, "synchronizeFile");
        v48 = v40;
        -[NSObject closeFile](v40, "closeFile");
        +[MKLog log](MKLog, "log");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = objc_msgSend(v56, "length");
          *(_DWORD *)buf = 134217984;
          v63 = v42;
          _os_log_impl(&dword_21EC08000, v41, OS_LOG_TYPE_INFO, "appended some bytes to a file. bytes=%ld", buf, 0xCu);
        }

        v21 = v50;
        a7 = v51;
        v43 = a11;
        if (v55 + v53 == v51)
          v43 = 1;
        goto LABEL_34;
      }
      v21 = v50;
      v44 = v39 == v51;
      a7 = v51;
      if (!v44)
      {
        v49 = v33;
        +[MKLog log](MKLog, "log");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
        v48 = v45;
        if (v46)
          -[MKFileMigrator import:filename:offset:length:total:complete:].cold.2(v45);
        v43 = a11;
LABEL_34:

        -[MKPhotoLibraryMigrator addImportTime:](self, "addImportTime:", v24);
        if (!v43)
        {
LABEL_41:

          v17 = v56;
          goto LABEL_42;
        }
        goto LABEL_35;
      }

      -[MKPhotoLibraryMigrator addImportTime:](self, "addImportTime:", v24);
    }
    else
    {
      if ((objc_msgSend(v58, "fileExistsAtPath:", v59) & 1) == 0)
        objc_msgSend(v56, "writeToFile:atomically:", v59, 1);
      -[MKPhotoLibraryMigrator addImportTime:](self, "addImportTime:", v24);
      if (v53 != a7 && !a11)
        goto LABEL_41;
    }
LABEL_35:
    v52 = v29;
    +[MKLog log](MKLog, "log", v48);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = (uint64_t)v59;
      _os_log_impl(&dword_21EC08000, v47, OS_LOG_TYPE_INFO, "will add a file to asset queue. file=%@", buf, 0xCu);
    }

    if (!a7)
      a7 = objc_msgSend(v58, "mk_fileSizeAtPath:", v59);
    v35 = -[MKPhotoLibraryAsset initWithPath:filename:collection:originalFilename:size:]([MKPhotoLibraryAsset alloc], "initWithPath:filename:collection:originalFilename:size:", v59, v19, v20, v21, a7);
    -[MKPhotoLibraryAssetDatabase addAsset:](self->_db, "addAsset:", v35);
    -[MKMigrator migratorDidImport](self, "migratorDidImport");
    -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", -[MKPhotoLibraryAsset size](v35, "size"));
    v29 = v52;
    goto LABEL_40;
  }
  +[MKLog log](MKLog, "log");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[MKPhotoLibraryMigrator import:identifier:offset:length:total:filename:collection:originalFilename:complete:].cold.1();
LABEL_42:

}

- (void)addToAssetQueue:(id)a3
{
  void *v4;

  -[MKPhotoLibraryAssetDatabase addAsset:](self->_db, "addAsset:", a3);
  -[MKMigrator delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "migratorWillExecuteOperation:", self);

  -[MKPhotoLibraryMigrator photoLibraryWillAddAsset](self, "photoLibraryWillAddAsset");
}

- (void)photoLibraryWillAddAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  MKPhotoLibrary *photoLibrary;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id location;

  if (!self->_isBusy)
  {
    if (-[MKPhotoLibraryAssetDatabase count](self->_db, "count"))
    {
      self->_isBusy = 1;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPhotoLibraryAssetDatabase asset](self->_db, "asset");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "filename");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "originalFilename");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "size");
      v9 = -[MKPhotoLibraryMigrator shouldRetry](self, "shouldRetry");
      objc_initWeak(&location, self);
      photoLibrary = self->_photoLibrary;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __50__MKPhotoLibraryMigrator_photoLibraryWillAddAsset__block_invoke;
      v14[3] = &unk_24E3592F0;
      objc_copyWeak(&v18, &location);
      v11 = v5;
      v15 = v11;
      v19 = v9;
      v12 = v3;
      v16 = v12;
      v13 = v4;
      v17 = v13;
      -[MKPhotoLibrary addAsset:filename:originalFilename:size:completion:](photoLibrary, "addAsset:filename:originalFilename:size:completion:", v11, v6, v7, v8, v14);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);

    }
  }
}

void __50__MKPhotoLibraryMigrator_photoLibraryWillAddAsset__block_invoke(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id WeakRetained;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  _BYTE v24[10];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  +[MKLog log](MKLog, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v24 = a2;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = a3;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_21EC08000, v12, OS_LOG_TYPE_INFO, "did import a media file. success=%d, interrupted=%d, file=%@, error=%@", buf, 0x22u);
  }

  if (a3 && *(_BYTE *)(a1 + 64))
  {
    +[MKLog log](MKLog, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v24 = v15;
      _os_log_impl(&dword_21EC08000, v14, OS_LOG_TYPE_INFO, "will retry to import an asset. file=%@", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "addImportTime:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "photoLibraryDidInterruptAsset:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isDeletableFileAtPath:", *(_QWORD *)(a1 + 32));

      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 32);
        v22 = 0;
        objc_msgSend(v18, "removeItemAtPath:error:", v19, &v22);
        v20 = v22;

        if (v20)
        {
          +[MKLog log](MKLog, "log");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.6();

        }
      }
    }
    objc_msgSend(WeakRetained, "addImportTime:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "photoLibraryDidAddAsset:identifier:", *(_QWORD *)(a1 + 48), v9);
  }

}

- (BOOL)shouldRetry
{
  return self->_interruptionCount < 0xB;
}

- (void)retry
{
  ++self->_interruptionCount;
  -[MKPhotoLibraryMigrator setIsBusy:](self, "setIsBusy:", 0);
  -[MKPhotoLibraryMigrator photoLibraryWillAddAsset](self, "photoLibraryWillAddAsset");
}

- (void)resetInterruptionCount
{
  self->_interruptionCount = 0;
}

- (void)photoLibraryDidInterruptAsset:(id)a3
{
  NSObject *assetQueue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  assetQueue = self->_assetQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__MKPhotoLibraryMigrator_photoLibraryDidInterruptAsset___block_invoke;
  v5[3] = &unk_24E359318;
  objc_copyWeak(&v6, &location);
  dispatch_async(assetQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__MKPhotoLibraryMigrator_photoLibraryDidInterruptAsset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "retry");

}

- (void)photoLibraryDidAddAsset:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *assetQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  assetQueue = self->_assetQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__MKPhotoLibraryMigrator_photoLibraryDidAddAsset_identifier___block_invoke;
  v11[3] = &unk_24E359340;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(assetQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __61__MKPhotoLibraryMigrator_photoLibraryDidAddAsset_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "resetInterruptionCount");
  objc_msgSend(WeakRetained, "photoLibraryDidSetIdentifier:forAsset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsBusy:", 0);
  objc_msgSend(WeakRetained, "photoLibraryWillAddAsset");

}

- (void)photoLibraryDidSetIdentifier:(id)a3 forAsset:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v11, "length"))
  {
    -[MKMigrator migratorDidImport](self, "migratorDidImport");
    -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v6, "size"));
    objc_msgSend(v6, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_albumMigrator);
      objc_msgSend(WeakRetained, "setIdentifier:forAsset:", v11, v6);

    }
  }
  else
  {
    -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", 0);
  }
  -[MKPhotoLibraryAssetDatabase remove:](self->_db, "remove:", v6);
  -[MKMigrator delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "migratorDidExecuteOperation:", self);

}

- (void)import
{
  MKPhotoLibraryAssetDatabase *db;
  objc_super v4;

  -[MKPhotoLibrary close](self->_photoLibrary, "close");
  db = self->_db;
  self->_db = 0;

  v4.receiver = self;
  v4.super_class = (Class)MKPhotoLibraryMigrator;
  -[MKMigrator import](&v4, sel_import);
}

- (void)addImportTime:(id)a3
{
  id v4;
  id v5;
  unint64_t type;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  type = self->_type;
  if (type == 1)
  {
    objc_msgSend(v5, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videos");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (type)
      goto LABEL_7;
    objc_msgSend(v5, "payload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photos");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v4);
    v12 = v11;

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v12);
    -[NSObject importElapsedTime](v9, "importElapsedTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "decimalNumberByAdding:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setImportElapsedTime:](v9, "setImportElapsedTime:", v15);

    goto LABEL_9;
  }
LABEL_7:
  +[MKLog log](MKLog, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = self->_type;
    v17[0] = 67109120;
    v17[1] = v16;
    _os_log_impl(&dword_21EC08000, v9, OS_LOG_TYPE_INFO, "Not adding import time for unknown type: %ul", (uint8_t *)v17, 8u);
  }
LABEL_9:

  objc_sync_exit(v5);
}

- (BOOL)importAndWait
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  char v9;

  -[MKPhotoLibraryAssetDatabase asset](self->_db, "asset");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      v5 = 0;
      v9 = 1;
      do
      {
        if (v9)
          v6 = v5 > 0xA;
        else
          v6 = 1;
        if (v6)
          break;
        ++v5;
      }
      while (!-[MKPhotoLibraryMigrator importAssetAndWait:retryNeeded:](self, "importAssetAndWait:retryNeeded:", v4, &v9));
      -[MKPhotoLibraryAssetDatabase remove:](self->_db, "remove:", v4);
      -[MKPhotoLibraryAssetDatabase asset](self->_db, "asset");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    while (v7);
  }
  return 1;
}

- (BOOL)importAssetAndWait:(id)a3 retryNeeded:(BOOL *)a4
{
  void *v6;
  uint64_t v7;
  dispatch_semaphore_t v8;
  MKPhotoLibrary *photoLibrary;
  id v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  id WeakRetained;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  _QWORD v51[3];
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint8_t buf[4];
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  objc_msgSend(v25, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "filename");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "originalFilename");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v25, "size");
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v52 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v8 = dispatch_semaphore_create(0);
  -[MKMigrator migratorWillMeasureImport](self, "migratorWillMeasureImport");
  photoLibrary = self->_photoLibrary;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __57__MKPhotoLibraryMigrator_importAssetAndWait_retryNeeded___block_invoke;
  v27[3] = &unk_24E359368;
  v10 = v6;
  v28 = v10;
  v30 = &v53;
  v31 = v51;
  v32 = &v47;
  v33 = &v41;
  v34 = &v35;
  v11 = v8;
  v29 = v11;
  -[MKPhotoLibrary addAsset:filename:originalFilename:size:completion:](photoLibrary, "addAsset:filename:originalFilename:size:completion:", v10, v24, v23, v7, v27);
  if (!*((_BYTE *)v54 + 24))
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  -[MKMigrator migratorDidMeasureImport](self, "migratorDidMeasureImport");
  v12 = *((unsigned __int8 *)v48 + 24);
  if (*((_BYTE *)v48 + 24))
  {
    +[MKLog log](MKLog, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v10;
      _os_log_impl(&dword_21EC08000, v13, OS_LOG_TYPE_INFO, "will retry to import an asset. file=%@", buf, 0xCu);
    }

    *a4 = 1;
  }
  else
  {
    if (v42[5])
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isDeletableFileAtPath:", v10);

      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        objc_msgSend(v17, "removeItemAtPath:error:", v10, &v26);
        v18 = v26;

        if (v18)
        {
          +[MKLog log](MKLog, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.6();

        }
      }
    }
    if (objc_msgSend((id)v36[5], "length"))
    {
      -[MKMigrator migratorDidImport](self, "migratorDidImport");
      -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v25, "size"));
      objc_msgSend(v25, "collection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length") == 0;

      if (!v21)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_albumMigrator);
        objc_msgSend(WeakRetained, "setIdentifier:forAsset:", v36[5], v25);

      }
    }
    else
    {
      -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", 0);
    }
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(&v53, 8);

  return v12 == 0;
}

void __57__MKPhotoLibraryMigrator_importAssetAndWait_retryNeeded___block_invoke(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  +[MKLog log](MKLog, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v19[0] = 67109890;
    v19[1] = a2;
    v20 = 1024;
    v21 = a3;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_21EC08000, v11, OS_LOG_TYPE_INFO, "did import a media file. success=%d, interrupted=%d, file=%@, error=%@", (uint8_t *)v19, 0x22u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v10;
  v15 = v10;

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v9;
  v18 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (MKPhotoLibraryAlbumMigrator)albumMigrator
{
  return (MKPhotoLibraryAlbumMigrator *)objc_loadWeakRetained((id *)&self->_albumMigrator);
}

- (void)setAlbumMigrator:(id)a3
{
  objc_storeWeak((id *)&self->_albumMigrator, a3);
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void)setIsBusy:(BOOL)a3
{
  self->_isBusy = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_albumMigrator);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
}

- (void)import:identifier:offset:length:total:filename:collection:originalFilename:complete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ can't continue to import a media file because no identifier or filename found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
