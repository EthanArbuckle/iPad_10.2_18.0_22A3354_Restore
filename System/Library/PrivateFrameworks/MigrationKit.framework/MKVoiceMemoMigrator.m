@implementation MKVoiceMemoMigrator

- (MKVoiceMemoMigrator)init
{
  MKVoiceMemoMigrator *v2;
  MKVoiceMemoMigrator *v3;
  void *v4;
  MKFileProvider *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *fileRoot;
  NSObject *v10;
  NSString *v11;
  NSString *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *supports;
  uint64_t v18;
  NSSet *extensions;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *tempRoot;
  id v24;
  NSString *v25;
  NSObject *v26;
  MKFileDecoder *v27;
  MKFileDecoder *fileDecoder;
  MKAudioDecoder *v29;
  MKAudioDecoder *audioDecoder;
  id v32;
  id v33;
  objc_super v34;
  const __CFString *v35;
  void *v36;
  uint8_t buf[4];
  NSString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)MKVoiceMemoMigrator;
  v2 = -[MKMigrator init](&v34, sel_init);
  v3 = v2;
  if (!v2)
    return v3;
  -[MKMigrator setType:](v2, "setType:", 14);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MKFileProvider);
  -[MKFileProvider fetchRootPath](v5, "fetchRootPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    MKLocalizedString(CFSTR("MOVE_TO_IOS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    fileRoot = v3->_fileRoot;
    v3->_fileRoot = (NSString *)v8;

    +[MKLog log](MKLog, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v3->_fileRoot;
      *(_DWORD *)buf = 138412290;
      v38 = v11;
      _os_log_impl(&dword_21EC08000, v10, OS_LOG_TYPE_INFO, "file storage path=%@", buf, 0xCu);
    }

    if ((objc_msgSend(v4, "fileExistsAtPath:", v3->_fileRoot) & 1) != 0)
      goto LABEL_13;
    v12 = v3->_fileRoot;
    v33 = 0;
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 0, 0, &v33);
    v13 = v33;
    if (v13)
    {
      +[MKLog log](MKLog, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MKVoiceMemoMigrator init].cold.3();

    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MKVoiceMemoMigrator init].cold.2();
  }

LABEL_13:
  v35 = CFSTR("m4a");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("soun/aac"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v16 = objc_claimAutoreleasedReturnValue();
  supports = v3->_supports;
  v3->_supports = (NSDictionary *)v16;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E36C818);
  v18 = objc_claimAutoreleasedReturnValue();
  extensions = v3->_extensions;
  v3->_extensions = (NSSet *)v18;

  NSHomeDirectory();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("/Library/MigrationKit/"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "stringByAppendingPathComponent:", CFSTR("voice_memo"));
  v22 = objc_claimAutoreleasedReturnValue();
  tempRoot = v3->_tempRoot;
  v3->_tempRoot = (NSString *)v22;

  v24 = 0;
  if ((objc_msgSend(v4, "fileExistsAtPath:", v3->_tempRoot) & 1) == 0)
  {
    v25 = v3->_tempRoot;
    v32 = 0;
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v25, 1, 0, &v32);
    v24 = v32;
    if (v24)
    {
      +[MKLog log](MKLog, "log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[MKFileMigrator import:filename:offset:length:total:complete:].cold.4();

    }
  }
  v27 = objc_alloc_init(MKFileDecoder);
  fileDecoder = v3->_fileDecoder;
  v3->_fileDecoder = v27;

  v29 = objc_alloc_init(MKAudioDecoder);
  audioDecoder = v3->_audioDecoder;
  v3->_audioDecoder = v29;

  return v3;
}

- (void)importChunk:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 originalFilename:(id)a9 dateAdded:(id)a10 complete:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  MKVoiceMemoMigrator *v21;
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
  -[MKVoiceMemoMigrator import:identifier:offset:length:total:filename:originalFilename:dateAdded:complete:](v21, "import:identifier:offset:length:total:filename:originalFilename:dateAdded:complete:", v25, v17, a5, a6, a7, v18, v19, v20, v24);
  objc_autoreleasePoolPop(v23);
  objc_sync_exit(v21);

}

- (void)import:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 originalFilename:(id)a9 dateAdded:(id)a10 complete:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  BOOL v41;
  NSObject *v42;
  void *v44;
  MKVoiceMemoMigrator *v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  if (objc_msgSend(a4, "length") && objc_msgSend(v18, "length"))
  {
    v45 = self;
    v46 = a6;
    -[NSString stringByAppendingPathComponent:](self->_tempRoot, "stringByAppendingPathComponent:", v18);
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject pathExtension](v21, "pathExtension");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = a7;
    if (objc_msgSend(v48, "length"))
    {
      -[NSObject stringByDeletingPathExtension](v21, "stringByDeletingPathExtension");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject pathExtension](v21, "pathExtension");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lowercaseString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByAppendingPathExtension:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      a7 = v47;
      v21 = v25;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a5)
    {
      v49 = 0;
      objc_msgSend(v26, "attributesOfItemAtPath:error:", v21, &v49);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v49;
      if (v29)
      {
        v30 = v29;
        v31 = v28;
        +[MKLog log](MKLog, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[MKFileMigrator import:filename:offset:length:total:complete:].cold.3();

        goto LABEL_32;
      }
      v44 = v28;
      objc_msgSend(v28, "objectForKey:", *MEMORY[0x24BDD0D08]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "unsignedLongLongValue");

      if (v37 == a5)
      {
        objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v21);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "seekToEndOfFile");
        objc_msgSend(v38, "writeData:", v17);
        objc_msgSend(v38, "synchronizeFile");
        objc_msgSend(v38, "closeFile");
        +[MKLog log](MKLog, "log");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v40 = objc_msgSend(v17, "length");
          *(_DWORD *)buf = 134217984;
          v51 = v40;
          _os_log_impl(&dword_21EC08000, v39, OS_LOG_TYPE_INFO, "appended some bytes to a file. bytes=%ld", buf, 0xCu);
        }

        a7 = v47;
        if (a5 + v46 != v47 && !a11)
          goto LABEL_32;
        goto LABEL_29;
      }
      v41 = v37 == v47;
      a7 = v47;
      if (v41)
      {

        goto LABEL_29;
      }
      +[MKLog log](MKLog, "log");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[MKFileMigrator import:filename:offset:length:total:complete:].cold.2(v42);

    }
    else
    {
      if ((objc_msgSend(v26, "fileExistsAtPath:", v21) & 1) == 0
        && (objc_msgSend(v17, "writeToFile:atomically:", v21, 1) & 1) == 0)
      {
        objc_msgSend(v18, "mk_validatePath");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33)
        {
          v34 = (void *)MEMORY[0x24BDD1540];
          v52 = *MEMORY[0x24BDD0FC8];
          v53[0] = CFSTR("failed to write a file");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("MKVoiceMemoError"), 1, v35);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          a7 = v47;
        }
        -[MKMigrator migratorDidFailWithImportError:](v45, "migratorDidFailWithImportError:", v33);

      }
      if (v46 == a7)
        goto LABEL_29;
    }
    if (!a11)
    {
LABEL_32:

      goto LABEL_33;
    }
LABEL_29:
    if (!a7)
      a7 = objc_msgSend(v27, "mk_fileSizeAtPath:", v21);
    -[MKVoiceMemoMigrator import:originalFilename:dateAdded:size:](v45, "import:originalFilename:dateAdded:size:", v21, v19, v20, a7);
    goto LABEL_32;
  }
  +[MKLog log](MKLog, "log");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[MKVoiceMemoMigrator import:identifier:offset:length:total:filename:originalFilename:dateAdded:complete:].cold.1();
LABEL_33:

}

- (BOOL)isSupported:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && -[NSSet containsObject:](self->_extensions, "containsObject:", v5))
  {
    -[MKFileDecoder extractFormatOfAsset:](self->_fileDecoder, "extractFormatOfAsset:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVideoDecoder extractFormatOfAsset:](self->_audioDecoder, "extractFormatOfAsset:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
    {
      -[NSDictionary objectForKeyedSubscript:](self->_supports, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v7);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)import:(id)a3 originalFilename:(id)a4 dateAdded:(id)a5 size:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  MKVoiceMemo *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  MKVoiceMemo *v26;
  id v27;
  id location;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[MKVoiceMemoMigrator isSupported:](self, "isSupported:", v10);
  v14 = -[MKVoiceMemo initWithAudioPath:originalFilename:dateAdded:size:]([MKVoiceMemo alloc], "initWithAudioPath:originalFilename:dateAdded:size:", v10, v11, v12, a6);
  if (v13)
  {
    -[MKMigrator delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "migratorWillExecuteOperation:", self);

    objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x24BEC0D50];
    -[MKVoiceMemo audioUrl](v14, "audioUrl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVoiceMemo name](v14, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVoiceMemo dateAdded](v14, "dateAdded");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __62__MKVoiceMemoMigrator_import_originalFilename_dateAdded_size___block_invoke;
    v25[3] = &unk_24E359BD8;
    objc_copyWeak(&v27, &location);
    v26 = v14;
    objc_msgSend(v16, "importRecordingWithSourceAudioURL:name:date:completionHandler:", v17, v18, v19, v25);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    v30[0] = CFSTR("File format is not supported");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("MKVoiceMemoError"), 2, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKVoiceMemo audioPath](v14, "audioPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVoiceMemo originalFilename](v14, "originalFilename");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVoiceMemoMigrator moveUnsupportedItemsToFiles:fileName:](self, "moveUnsupportedItemsToFiles:fileName:", v23, v24);

    -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v22);
  }

}

void __62__MKVoiceMemoMigrator_import_originalFilename_dateAdded_size___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "didImport:url:error:", *(_QWORD *)(a1 + 32), v7, v6);

}

- (void)didImport:(id)a3 url:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[MKLog log](MKLog, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v9 || v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MKVoiceMemoMigrator didImport:url:error:].cold.1(v8, (uint64_t)v10, v12);

    objc_msgSend(v8, "audioPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originalFilename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVoiceMemoMigrator moveUnsupportedItemsToFiles:fileName:](self, "moveUnsupportedItemsToFiles:fileName:", v14, v15);

    -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v10);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "audioPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v13;
      v20 = 2112;
      v21 = v9;
      v22 = 2048;
      v23 = objc_msgSend(v8, "size");
      _os_log_impl(&dword_21EC08000, v12, OS_LOG_TYPE_INFO, "sucessfully imported voice memo. file=%@, savedRecordingURI=%@, size=%llu", (uint8_t *)&v18, 0x20u);

    }
    -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v8, "size"));
    -[MKMigrator migratorDidImport](self, "migratorDidImport");
  }
  objc_msgSend(v8, "audioPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKVoiceMemoMigrator removeTempFile:](self, "removeTempFile:", v16);

  -[MKMigrator delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "migratorDidExecuteOperation:", self);

}

- (void)moveUnsupportedItemsToFiles:(id)a3 fileName:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  NSString *fileRoot;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  char v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  void *v27;
  id v28;
  id v29;
  MKVoiceMemoMigrator *v30;
  void *v31;
  uint64_t v32;
  uint8_t buf[4];
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = 0x24BDBC000uLL;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v6);
  v30 = self;
  fileRoot = self->_fileRoot;
  if (fileRoot)
  {
    -[NSString stringByAppendingPathComponent:](fileRoot, "stringByAppendingPathComponent:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "fileExistsAtPath:", v11))
    {
      v27 = v9;
      v29 = v6;
      objc_msgSend(v7, "stringByDeletingPathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v7;
      objc_msgSend(v7, "pathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v15 = 0;
      v16 = v11;
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %ld"), v12, v14 + 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v17, "stringByAppendingFormat:", CFSTR(".%@"), v13);
          v18 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v18;
        }
        -[NSString stringByAppendingPathComponent:](v30->_fileRoot, "stringByAppendingPathComponent:", v17);
        v11 = objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v31, "fileExistsAtPath:", v11);
        if ((v19 & 1) == 0)
          break;
        v15 = (unint64_t)(v14 + 2) > 0x7FFFFFFD;
        ++v14;
        v16 = v11;
      }
      while (v14 != 2147483645);

      v7 = v28;
      v6 = v29;
      v9 = v27;
      v8 = 0x24BDBC000;
    }
    else
    {
      v15 = 0;
    }
    v20 = (void *)objc_msgSend(objc_alloc(*(Class *)(v8 + 3912)), "initFileURLWithPath:", v11);
    if (v15)
      goto LABEL_20;
    v32 = 0;
    v21 = objc_msgSend(v31, "moveItemAtURL:toURL:error:", v9, v20, &v32);
    +[MKLog log](MKLog, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
    if ((v21 & 1) != 0)
    {
      if (v23)
      {
        *(_DWORD *)buf = 67109120;
        v34 = 1;
        v24 = "Local File Storage did import an asset. success=%d";
        v25 = v22;
        v26 = 8;
LABEL_18:
        _os_log_impl(&dword_21EC08000, v25, OS_LOG_TYPE_INFO, v24, buf, v26);
      }
    }
    else if (v23)
    {
      *(_WORD *)buf = 0;
      v24 = "Local File Storage failed to import the voice memo.";
      v25 = v22;
      v26 = 2;
      goto LABEL_18;
    }

LABEL_20:
    goto LABEL_21;
  }
  +[MKLog log](MKLog, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[MKVoiceMemoMigrator moveUnsupportedItemsToFiles:fileName:].cold.1();
LABEL_21:

}

- (void)removeTempFile:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeletableFileAtPath:", v3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v6, "removeItemAtPath:error:", v3, &v9);
    v7 = v9;

    if (v7)
    {
      +[MKLog log](MKLog, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MKVoiceMemoMigrator removeTempFile:].cold.1();

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_supports, 0);
  objc_storeStrong((id *)&self->_audioDecoder, 0);
  objc_storeStrong((id *)&self->_fileDecoder, 0);
  objc_storeStrong((id *)&self->_fileRoot, 0);
  objc_storeStrong((id *)&self->_tempRoot, 0);
}

- (void)init
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_2();
  v3 = v0;
  OUTLINED_FUNCTION_4_1(&dword_21EC08000, v1, (uint64_t)v1, "%@ couldn't create a local file storage directory and will skip Voice Memos fallback. error=%@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)import:identifier:offset:length:total:filename:originalFilename:dateAdded:complete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ can't continue to import a voice memo because no identifier or filename found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didImport:(void *)a1 url:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "audioPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  v8 = a2;
  OUTLINED_FUNCTION_4_1(&dword_21EC08000, a3, v6, "could not import voice memo. file=%@ error=%@", v7);

}

- (void)moveUnsupportedItemsToFiles:fileName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ can't import a file because it could not find a root path.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)removeTempFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "could not delete a temporary voice memo file. file=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
