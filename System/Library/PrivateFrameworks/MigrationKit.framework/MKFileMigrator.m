@implementation MKFileMigrator

- (MKFileMigrator)init
{
  MKFileMigrator *v2;
  MKFileMigrator *v3;
  MKFileProvider *v4;
  uint64_t v5;
  NSString *root;
  MKFileMigrator *v7;
  NSObject *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MKFileMigrator;
  v2 = -[MKMigrator init](&v10, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_3;
  -[MKMigrator setType:](v2, "setType:", 9);
  v4 = objc_alloc_init(MKFileProvider);
  -[MKFileProvider fetchRootPath](v4, "fetchRootPath");
  v5 = objc_claimAutoreleasedReturnValue();
  root = v3->_root;
  v3->_root = (NSString *)v5;

  if (!v3->_root)
  {
    +[MKLog log](MKLog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MKFileMigrator init].cold.1();

    v7 = 0;
  }
  else
  {
LABEL_3:
    v7 = v3;
  }

  return v7;
}

- (void)importChunk:(id)a3 filename:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 complete:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  MKFileMigrator *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v8 = a8;
  v18 = a3;
  v14 = a4;
  v15 = self;
  v16 = objc_sync_enter(v15);
  v17 = (void *)MEMORY[0x2207B99F4](v16);
  -[MKFileMigrator import:filename:offset:length:total:complete:](v15, "import:filename:offset:length:total:complete:", v18, v14, a5, a6, a7, v8);
  objc_autoreleasePoolPop(v17);
  objc_sync_exit(v15);

}

- (void)import:(id)a3 filename:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 complete:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  NSString *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v8 = a8;
  v47 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v14 = a4;
  if (objc_msgSend(v14, "length"))
  {
    v37 = a6;
    v38 = a7;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = objc_claimAutoreleasedReturnValue();
    v39 = self->_root;
    -[NSString stringByAppendingPathComponent:](v39, "stringByAppendingPathComponent:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByDeletingLastPathComponent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "fileExistsAtPath:", v41) & 1) != 0
      || (v44 = 0,
          objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v41, 1, 0, &v44),
          (v40 = v44) == 0))
    {
      v40 = 0;
      if (a5)
        goto LABEL_7;
    }
    else
    {
      +[MKLog log](MKLog, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[MKFileMigrator import:filename:offset:length:total:complete:].cold.4();

      if (a5)
      {
LABEL_7:
        v43 = 0;
        objc_msgSend(v17, "attributesOfItemAtPath:error:", v16, &v43);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v43;
        if (v20)
        {
          v21 = v20;
          +[MKLog log](MKLog, "log");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[MKFileMigrator import:filename:offset:length:total:complete:].cold.3();

          goto LABEL_35;
        }
        -[NSObject objectForKey:](v19, "objectForKey:", *MEMORY[0x24BDD0D08]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "unsignedLongLongValue");

        if (v25 == a5)
        {
          objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v16);
          v26 = objc_claimAutoreleasedReturnValue();
          -[NSObject seekToEndOfFile](v26, "seekToEndOfFile");
          -[NSObject writeData:](v26, "writeData:", v42);
          -[NSObject synchronizeFile](v26, "synchronizeFile");
          -[NSObject closeFile](v26, "closeFile");
          +[MKLog log](MKLog, "log");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = objc_msgSend(v42, "length");
            *(_DWORD *)buf = 134217984;
            v46 = v28;
            _os_log_impl(&dword_21EC08000, v27, OS_LOG_TYPE_INFO, "appended some bytes to a file. bytes=%ld", buf, 0xCu);
          }

          if (a5 + v37 == v38)
            v8 = 1;
        }
        else
        {
          if (v25 == v38)
          {
            v8 = 1;
LABEL_31:

LABEL_32:
            -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v42, "length"));
            if (!v8)
            {
LABEL_36:

              goto LABEL_37;
            }
            -[MKMigrator migratorDidImport](self, "migratorDidImport");
            +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
            v21 = (id)objc_claimAutoreleasedReturnValue();
            objc_sync_enter(v21);
            objc_msgSend(v21, "payload");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "files");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "timeIntervalSinceDate:", v15);
            v33 = v32;

            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v33);
            objc_msgSend(v30, "importElapsedTime");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "decimalNumberByAdding:", v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setImportElapsedTime:", v36);

            objc_sync_exit(v21);
            +[MKLog log](MKLog, "log");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21EC08000, v19, OS_LOG_TYPE_INFO, "did import a file.", buf, 2u);
            }
LABEL_35:

            goto LABEL_36;
          }
          +[MKLog log](MKLog, "log");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[MKFileMigrator import:filename:offset:length:total:complete:].cold.2(v26);
        }

        goto LABEL_31;
      }
    }
    if ((objc_msgSend(v17, "fileExistsAtPath:", v16) & 1) == 0
      && (objc_msgSend(v42, "writeToFile:atomically:", v16, 1) & 1) == 0)
    {
      objc_msgSend(v14, "mk_validatePath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MKFileError"), 1, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v23);

    }
    if (a6 == v38)
      v8 = 1;
    goto LABEL_32;
  }
  +[MKLog log](MKLog, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MKFileMigrator import:filename:offset:length:total:complete:].cold.1();
LABEL_37:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ could not get a path for Local File Storage and will skip all files transferred.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)import:filename:offset:length:total:complete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ can't continue to import a media file because no filename found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)import:(os_log_t)log filename:offset:length:total:complete:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "a file was corrupted by others.", v1, 2u);
}

- (void)import:filename:offset:length:total:complete:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "could not get file attributes. error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)import:filename:offset:length:total:complete:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
