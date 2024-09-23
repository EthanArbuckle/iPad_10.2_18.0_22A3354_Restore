@implementation MKContainerMigrator

- (MKContainerMigrator)init
{
  MKContainerMigrator *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *containers;
  MKHex *v5;
  MKCrypto *v6;
  void *v7;
  MKCrypto *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)MKContainerMigrator;
  v2 = -[MKMigrator init](&v20, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    containers = v2->_containers;
    v2->_containers = v3;

    v5 = objc_alloc_init(MKHex);
    v6 = [MKCrypto alloc];
    -[MKHex hexToData:](v5, "hexToData:", CFSTR("331BB104B13265802FC130A8AC28927CFF1CC3F0D502D0B0DE25A8D6F87D3528"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MKCrypto initWithKey:](v6, "initWithKey:", v7);

    -[MKHex hexToData:](v5, "hexToData:", CFSTR("94FBBFDC34ECDA1EBEF8B963954CCE8370B1841A7E12A080793994F1184A8F213A0430023E"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCrypto decryptData:](v8, "decryptData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKHex hexToData:](v5, "hexToData:", CFSTR("28EB9810F0391B9C3EDE3CF2BF6877F3BA7DE19BD371E17ABADE930CD817916E9CBBA56265158D4F4B32F15DF9BA7C0C843BE510FE128C505A33DD0C922309853DD00A6EDD954F254D5666F40362AD6F"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCrypto decryptData:](v8, "decryptData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
    v21 = v14;
    v22 = v13;
    v15 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKContainerMigrator setSignatures:](v2, "setSignatures:", v18);

    -[MKMigrator setType:](v2, "setType:", 7);
  }
  return v2;
}

- (void)importContainer:(id)a3 signature:(id)a4 chunk:(id)a5 filename:(id)a6 offset:(unint64_t)a7 length:(unint64_t)a8 total:(unint64_t)a9 required:(BOOL)a10 excludedFromBackup:(BOOL)a11 complete:(BOOL)a12
{
  id v17;
  id v18;
  id v19;
  MKContainerMigrator *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v25;

  v25 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = self;
  v21 = objc_sync_enter(v20);
  v22 = (void *)MEMORY[0x2207B99F4](v21);
  BYTE2(v23) = a12;
  LOWORD(v23) = __PAIR16__(a11, a10);
  -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:](v20, "import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:", v25, v17, v18, v19, a7, a8, a9, v23);
  objc_autoreleasePoolPop(v22);
  objc_sync_exit(v20);

}

- (void)import:(id)a3 signature:(id)a4 chunk:(id)a5 filename:(id)a6 offset:(unint64_t)a7 length:(unint64_t)a8 total:(unint64_t)a9 required:(BOOL)a10 excludedFromBackup:(BOOL)a11 complete:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  MKPlaceholder *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  char v41;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  _BYTE v73[18];
  __int16 v74;
  unint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  if (objc_msgSend(v21, "length"))
  {
    if (v18)
    {
      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v22 = objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_signatures, "objectForKey:", v18);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v65, "containsObject:", v19) & 1) != 0)
        {
          -[NSMutableDictionary objectForKey:](self->_containers, "objectForKey:", v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            goto LABEL_6;
          v34 = -[MKPlaceholder initWithBundleIdentifier:]([MKPlaceholder alloc], "initWithBundleIdentifier:", v18);
          if (-[MKPlaceholder enabled](v34, "enabled"))
          {
            -[MKPlaceholder container](v34, "container");
            v35 = objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](self->_containers, "setObject:forKey:", v35, v18);

            v23 = (void *)v35;
            if (v35)
            {
LABEL_6:
              objc_msgSend(v23, "stringByAppendingPathComponent:", v21, v23);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "stringByDeletingLastPathComponent");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              +[MKLog log](MKLog, "log");
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138413058;
                v71 = (uint64_t)v64;
                v72 = 2048;
                *(_QWORD *)v73 = a7;
                *(_WORD *)&v73[8] = 2048;
                *(_QWORD *)&v73[10] = a8;
                v74 = 2048;
                v75 = a9;
                _os_log_impl(&dword_21EC08000, v24, OS_LOG_TYPE_INFO, "file=%@, offset=%lld, length=%lld, total=%lld", buf, 0x2Au);
              }

              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v63, "fileExistsAtPath:", v62) & 1) != 0
                || (v69 = 0,
                    objc_msgSend(v63, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v62, 1, 0, &v69), (v61 = v69) == 0))
              {
                v61 = 0;
                if (a7)
                {
LABEL_13:
                  v66 = 0;
                  objc_msgSend(v63, "attributesOfItemAtPath:error:", v64, &v66);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v66;
                  if (v27)
                  {
                    v28 = v27;
                    +[MKLog log](MKLog, "log");
                    v29 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                      -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.7();

                    v26 = v28;
                    goto LABEL_59;
                  }
                  objc_msgSend(v26, "objectForKey:", *MEMORY[0x24BDD0D08]);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v36, "unsignedLongLongValue");

                  if (v37 == a7)
                  {
                    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v64);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "seekToEndOfFile");
                    objc_msgSend(v38, "writeData:", v20);
                    objc_msgSend(v38, "synchronizeFile");
                    objc_msgSend(v38, "closeFile");
                    +[MKLog log](MKLog, "log");
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                    {
                      v40 = objc_msgSend(v20, "length");
                      *(_DWORD *)buf = 134217984;
                      v71 = v40;
                      _os_log_impl(&dword_21EC08000, v39, OS_LOG_TYPE_INFO, "appended some bytes to a file. bytes=%ld", buf, 0xCu);
                    }

                  }
LABEL_58:

                  -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", objc_msgSend(v20, "length"));
                  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
                  v50 = (id)objc_claimAutoreleasedReturnValue();
                  objc_sync_enter(v50);
                  v26 = v50;
                  objc_msgSend(v50, "payload");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "whatsapp");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x24BDBCE60], "date");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "timeIntervalSinceDate:", v22);
                  v55 = v54;

                  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v55);
                  objc_msgSend(v52, "importElapsedTime");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "decimalNumberByAdding:", v56);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setImportElapsedTime:", v58);

                  objc_sync_exit(v26);
LABEL_59:

                  v31 = v60;
                  goto LABEL_60;
                }
              }
              else
              {
                +[MKLog log](MKLog, "log");
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.8();

                if (a7)
                  goto LABEL_13;
              }
              if (objc_msgSend(v63, "fileExistsAtPath:", v64))
              {
                if (!objc_msgSend(v63, "isDeletableFileAtPath:", v64))
                {
                  +[MKLog log](MKLog, "log");
                  v49 = objc_claimAutoreleasedReturnValue();
                  v26 = v49;
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.6();
                    v26 = v49;
                  }
                  goto LABEL_59;
                }
                v68 = 0;
                objc_msgSend(v63, "removeItemAtPath:error:", v64, &v68);
                v32 = v68;
                if (v32)
                {
                  v26 = v32;
                  +[MKLog log](MKLog, "log");
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.5((uint64_t)v64, v26, v33);

                  goto LABEL_59;
                }
              }
              v41 = objc_msgSend(v20, "writeToFile:atomically:", v64, 1);
              +[MKLog log](MKLog, "log");
              v42 = objc_claimAutoreleasedReturnValue();
              v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
              if ((v41 & 1) != 0)
              {
                if (v43)
                {
                  *(_DWORD *)buf = 138412290;
                  v71 = (uint64_t)v64;
                  _os_log_impl(&dword_21EC08000, v42, OS_LOG_TYPE_INFO, "created a file. file=%@", buf, 0xCu);
                }

                objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v64);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a11);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = *MEMORY[0x24BDBCC68];
                v67 = v61;
                objc_msgSend(v26, "setResourceValue:forKey:error:", v44, v45, &v67);
                v46 = v67;

                if (v46)
                {
                  +[MKLog log](MKLog, "log");
                  v47 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v46, "description");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v71 = (uint64_t)v64;
                    v72 = 1024;
                    *(_DWORD *)v73 = a11;
                    *(_WORD *)&v73[4] = 2112;
                    *(_QWORD *)&v73[6] = v59;
                    _os_log_error_impl(&dword_21EC08000, v47, OS_LOG_TYPE_ERROR, "could not set a resource value. file=%@, is_excluded_from_backup=%d, error=%@", buf, 0x1Cu);

                  }
                  v61 = v46;
                  goto LABEL_59;
                }
                -[MKMigrator migratorDidImport](self, "migratorDidImport");
                v61 = 0;
              }
              else
              {
                if (v43)
                {
                  *(_DWORD *)buf = 138412290;
                  v71 = (uint64_t)v64;
                  _os_log_impl(&dword_21EC08000, v42, OS_LOG_TYPE_INFO, "could not create a file. file=%@", buf, 0xCu);
                }

                objc_msgSend(v21, "mk_validatePath");
                v48 = objc_claimAutoreleasedReturnValue();
                if (!v48)
                {
                  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MKContainerError"), 1, 0);
                  v48 = objc_claimAutoreleasedReturnValue();
                }
                v26 = (void *)v48;
                -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:");
              }
              goto LABEL_58;
            }
          }
          else
          {

          }
          +[MKLog log](MKLog, "log");
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.4();
            goto LABEL_38;
          }
        }
        else
        {
          +[MKLog log](MKLog, "log");
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.9();
LABEL_38:
            v31 = v30;
          }
        }
LABEL_60:

        goto LABEL_61;
      }
      +[MKLog log](MKLog, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.3();
    }
    else
    {
      +[MKLog log](MKLog, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.2();
    }
  }
  else
  {
    +[MKLog log](MKLog, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.1();
  }
LABEL_61:

}

- (NSDictionary)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(id)a3
{
  objc_storeStrong((id *)&self->_signatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_containers, 0);
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ can't continue to import a file because no filename found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ can't continue to import a file because identifier was missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ can't continue to import a file because signature was missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_21EC08000, v0, v1, "%@ can't continue to import a file because the container was not set. id=%@");
  OUTLINED_FUNCTION_3();
}

- (void)import:(NSObject *)a3 signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.5(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_21EC08000, a3, OS_LOG_TYPE_ERROR, "could not delete a temporary file. file=%@, error=%@", (uint8_t *)&v6, 0x16u);

}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "could not delete a temporary file. file=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_21EC08000, v0, v1, "could not get file attributes. file=%@, error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_21EC08000, v0, v1, "file=%@, error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, v0, v1, "%@ can't continue to import a file because the signature was not approved.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
