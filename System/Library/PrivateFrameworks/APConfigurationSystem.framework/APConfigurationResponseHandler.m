@implementation APConfigurationResponseHandler

- (APConfigurationResponseHandler)init
{
  const char *v2;
  uint64_t v3;
  APConfigurationResponseHandler *v4;
  uint64_t v5;
  NSFileManager *fileManager;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *pathToTempDir;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *pathToConfig;
  const char *v15;
  uint64_t v16;
  NSString *pathToTraverse;
  id v18;
  const char *v19;
  uint64_t v20;
  APUnfairLock *lock;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)APConfigurationResponseHandler;
  v4 = -[APConfigurationResponseHandler init](&v23, sel_init);
  if (v4)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    fileManager = v4->_fileManager;
    v4->_fileManager = (NSFileManager *)v5;

    objc_msgSend__tempConfigPath(v4, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    pathToTempDir = v4->_pathToTempDir;
    v4->_pathToTempDir = (NSString *)v9;

    objc_msgSend_configSystemDirectoryPath(APConfigurationMediator, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    pathToConfig = v4->_pathToConfig;
    v4->_pathToConfig = (NSString *)v13;

    objc_msgSend_stringByAppendingPathComponent_(v4->_pathToTempDir, v15, (uint64_t)CFSTR("APCS-T"));
    v16 = objc_claimAutoreleasedReturnValue();
    pathToTraverse = v4->_pathToTraverse;
    v4->_pathToTraverse = (NSString *)v16;

    v18 = objc_alloc(MEMORY[0x24BDFD4C0]);
    v20 = objc_msgSend_initWithOptions_(v18, v19, 1);
    lock = v4->_lock;
    v4->_lock = (APUnfairLock *)v20;

    v4->_cancelled = 0;
  }
  return v4;
}

- (BOOL)processResponseWithData:(id)a3
{
  uint64_t v4;
  APVersionHelper *v5;
  APVersionData *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend__processData_(self, a2, (uint64_t)a3);
  v5 = [APVersionHelper alloc];
  v6 = objc_alloc_init(APVersionData);
  v8 = (void *)objc_msgSend_initWithDatasource_(v5, v7, (uint64_t)v6);

  v11 = objc_msgSend_systemVersion(v8, v9, v10);
  APLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v4 == 1200)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v11;
      _os_log_impl(&dword_235C39000, v13, OS_LOG_TYPE_DEFAULT, "Configuration system update completed successfully v%lu.", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v18 = v11;
      v19 = 2048;
      v20 = v4;
      _os_log_impl(&dword_235C39000, v13, OS_LOG_TYPE_ERROR, "Configuration system update failed v%lu, Status: %ld.", buf, 0x16u);
    }

    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v14, (uint64_t)CFSTR("Configuration system update failed v%lu, Status: %ld."), v11, v4);
    v13 = objc_claimAutoreleasedReturnValue();
    CreateDiagnosticReport();
  }

  objc_msgSend__sendCoreAnalyticsWithUpdateStatus_version_(self, v15, v4, v11);
  return v4 == 1200;
}

- (void)cancelProcess
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  id v9;

  objc_msgSend_lock(self, a2, v2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v4, v5);
  objc_msgSend_setCancelled_(self, v6, 1);
  objc_msgSend_unlock(v9, v7, v8);

}

- (BOOL)_isCancelled
{
  uint64_t v2;
  APConfigurationResponseHandler *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v3 = self;
  objc_msgSend_lock(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v4, v5, v6);
  LOBYTE(v3) = objc_msgSend_cancelled(v3, v7, v8);
  objc_msgSend_unlock(v4, v9, v10);

  return (char)v3;
}

- (int64_t)_processData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v21;
  uint64_t v22;
  APConfigurationDecompressor *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  int v46;
  const char *v47;
  uint64_t v48;

  v4 = a3;
  if (!objc_msgSend__createTempDirectory(self, v5, v6))
  {
    v11 = 1501;
    goto LABEL_10;
  }
  if (!objc_msgSend__isCancelled(self, v7, v8))
  {
    objc_msgSend_pathToTempDir(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v12, v13, (uint64_t)CFSTR("APCS.tar.gz"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend__writeCompressedFileWithData_atPath_(self, v15, (uint64_t)v4, v14) & 1) != 0)
    {
      if (!objc_msgSend__isCancelled(self, v16, v17))
      {
        if ((objc_msgSend__copyCurrentConfigToTraverse(self, v18, v19) & 1) == 0)
        {
          objc_msgSend__removeTempDirectory(self, v21, v22);
          v11 = 1503;
          goto LABEL_9;
        }
        if (!objc_msgSend__isCancelled(self, v21, v22))
        {
          v23 = objc_alloc_init(APConfigurationDecompressor);
          objc_msgSend_pathToTempDir(self, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingPathComponent_(v26, v27, (uint64_t)CFSTR("APCS.tar"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = objc_msgSend_decompressTarAtPath_toPath_(v23, v29, (uint64_t)v14, v28);
          if (v30 == 1200)
          {
            if (objc_msgSend__isCancelled(self, v31, v32))
            {
              objc_msgSend__removeTempDirectory(self, v33, v34);
              v11 = 1513;
            }
            else
            {
              objc_msgSend_pathToTempDir(self, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringByAppendingPathComponent_(v35, v36, (uint64_t)CFSTR("APCS"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_pathToTraverse(self, v38, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend__traverseDirectoryAtPath_replacingConfigurationAtPath_(self, v41, (uint64_t)v37, v40);

              if (v11 == 1200)
              {
                if (objc_msgSend__isCancelled(self, v42, v43))
                {
                  objc_msgSend__removeTempDirectory(self, v44, v45);
                  v11 = 1513;
                }
                else
                {
                  v46 = objc_msgSend__replaceConfigWithNewHierarchy(self, v44, v45);
                  objc_msgSend__removeTempDirectory(self, v47, v48);
                  if (v46)
                    v11 = 1200;
                  else
                    v11 = 1511;
                }
              }
              else
              {
                objc_msgSend__removeTempDirectory(self, v42, v43);
              }

            }
          }
          else
          {
            v11 = v30;
            objc_msgSend__removeTempDirectory(self, v31, v32);
          }

          goto LABEL_9;
        }
      }
      objc_msgSend__removeTempDirectory(self, v18, v19);
      v11 = 1513;
    }
    else
    {
      objc_msgSend__removeTempDirectory(self, v16, v17);
      v11 = 1502;
    }
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend__removeTempDirectory(self, v9, v10);
  v11 = 1513;
LABEL_10:

  return v11;
}

- (BOOL)_writeCompressedFileWithData:(id)a3 atPath:(id)a4
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  objc_msgSend_writeToFile_options_error_(a3, a2, (uint64_t)a4, 0x10000000, &v10);
  v4 = v10;
  if (v4)
  {
    APLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_description(v4, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_235C39000, v5, OS_LOG_TYPE_ERROR, "Error: Failed to write to file: %{public}@", buf, 0xCu);

    }
  }

  return v4 == 0;
}

- (BOOL)_createTempDirectory
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  BOOL v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_fileManager(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathToTempDir(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_fileExistsAtPath_(v4, v8, (uint64_t)v7)
    && (v23 = 0, objc_msgSend_removeItemAtPath_error_(v4, v9, (uint64_t)v7, &v23), (v10 = v23) != 0))
  {
    v11 = v10;
    APLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_description(v11, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v15;
      v16 = "Error: Failed to remove temp directory: %{public}@";
LABEL_8:
      _os_log_impl(&dword_235C39000, v12, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    }
  }
  else
  {
    v22 = 0;
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v4, v9, (uint64_t)v7, 0, 0, &v22);
    v17 = v22;
    if (!v17)
    {
      v20 = 1;
      goto LABEL_11;
    }
    v11 = v17;
    APLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_description(v11, v18, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v15;
      v16 = "Error: Failed to create temp directory: %{public}@";
      goto LABEL_8;
    }
  }

  v20 = 0;
LABEL_11:

  return v20;
}

- (BOOL)_copyCurrentConfigToTraverse
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_pathToConfig(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileManager(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_fileExistsAtPath_(v7, v8, (uint64_t)v4)
    && (objc_msgSend_pathToTraverse(self, v9, v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = 0,
        objc_msgSend_copyItemAtPath_toPath_error_(v7, v12, (uint64_t)v4, v11, &v20),
        v13 = v20,
        v11,
        v13))
  {
    APLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_description(v13, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_235C39000, v14, OS_LOG_TYPE_ERROR, "Error: Failed to create fallback file: %{public}@", buf, 0xCu);

    }
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (BOOL)_removeTempDirectory
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_fileManager(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathToTempDir(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend_removeItemAtPath_error_(v4, v8, (uint64_t)v7, &v15);
  v9 = v15;

  if (v9)
  {
    APLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_description(v9, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_235C39000, v10, OS_LOG_TYPE_ERROR, "Error: Failed to remove temp directory: %{public}@", buf, 0xCu);

    }
  }

  return v9 == 0;
}

- (BOOL)_replaceConfigWithNewHierarchy
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_fileManager(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathToConfig(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathToTraverse(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_fileExistsAtPath_(v4, v11, (uint64_t)v7))
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v12, (uint64_t)v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v14, (uint64_t)v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_(v4, v16, (uint64_t)v13, v15, 0, 3, 0, &v24);
    v17 = v24;

    if (!v17)
      goto LABEL_8;
  }
  else
  {
    v23 = 0;
    objc_msgSend_moveItemAtPath_toPath_error_(v4, v12, (uint64_t)v10, v7, &v23);
    v17 = v23;
    if (!v17)
      goto LABEL_8;
  }
  APLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_description(v17, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v21;
    _os_log_impl(&dword_235C39000, v18, OS_LOG_TYPE_ERROR, "Error: Failed to replace traversed hierarchy: %{public}@", buf, 0xCu);

  }
LABEL_8:

  return v17 == 0;
}

- (id)_tempConfigPath
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;

  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingPathComponent_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v13, v14, (uint64_t)CFSTR("APCS-TEMP"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)_traverseDirectoryAtPath:(id)a3 replacingConfigurationAtPath:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;
  const char *v12;
  const char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  id v47;
  int v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  const char *v69;
  uint64_t v70;
  void *v71;
  NSObject *log;
  int64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v5;
  objc_msgSend_enumeratorAtPath_(v9, v10, (uint64_t)v5);
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v86, v96, 16);
  v14 = 0;
  if (v82)
  {
    v15 = *(_QWORD *)v87;
    v79 = v9;
    v76 = v11;
    v77 = v6;
    v75 = *(_QWORD *)v87;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v87 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v16);
      objc_msgSend_stringByAppendingPathComponent_(v6, v13, (uint64_t)v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pathExtension(v17, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v21, v22, (uint64_t)&stru_2506FE700))
      {
        if ((objc_msgSend_fileExistsAtPath_(v9, v23, (uint64_t)v18) & 1) == 0)
        {
          v85 = v14;
          objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v9, v24, (uint64_t)v18, 1, 0, &v85);
          v25 = v85;

          v14 = 0;
          if (v25)
          {
            APLogForCategory();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_description(v25, v69, v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v91 = v71;
              _os_log_impl(&dword_235C39000, v67, OS_LOG_TYPE_ERROR, "Error: Create directory error: %{public}@.", buf, 0xCu);

            }
            v74 = 1507;
            v14 = v25;
            goto LABEL_43;
          }
        }
        goto LABEL_33;
      }
      if (objc_msgSend_isEqualToString_(v21, v23, (uint64_t)CFSTR("json")))
        break;
LABEL_33:

LABEL_34:
      if (v82 == ++v16)
      {
        v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v86, v96, 16);
        v82 = v66;
        if (v66)
          goto LABEL_3;
        goto LABEL_39;
      }
    }
    objc_msgSend_stringByDeletingLastPathComponent(v17, v26, v27);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v6, v28, (uint64_t)v80);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v29, v30, (uint64_t)CFSTR("ConfigurationNode.json"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v32, (uint64_t)v31);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v78, v33, (uint64_t)v17);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_versionNumberFromJSONFileAtPath_(APVersionHelper, v35, (uint64_t)v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v36, (uint64_t)v34);
      v38 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_fileExistsAtPath_(v9, v39, (uint64_t)v31))
      {
        objc_msgSend_versionNumberFromJSONFileAtPath_(APVersionHelper, v40, (uint64_t)v31);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v44 = objc_msgSend_integerValue(v37, v41, v42);
          if (v44 <= objc_msgSend_integerValue(v43, v45, v46))
          {
            APLogForCategory();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              log = v59;
              v62 = objc_msgSend_integerValue(v37, v60, v61);
              v65 = objc_msgSend_integerValue(v43, v63, v64);
              *(_DWORD *)buf = 138543874;
              v91 = v34;
              v92 = 2048;
              v93 = v62;
              v59 = log;
              v94 = 2048;
              v95 = v65;
              _os_log_impl(&dword_235C39000, log, OS_LOG_TYPE_DEBUG, "Node at path %{public}@ received with version: %ld, current version is %ld, skipping update for this node.", buf, 0x20u);
            }

            v48 = 0;
            v49 = 1;
            goto LABEL_31;
          }
        }
        v84 = v14;
        objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_(v79, v41, (uint64_t)v81, v38, 0, 3, 0, &v84);
        v47 = v84;

        v14 = v47;
      }
      else
      {
        v83 = v14;
        objc_msgSend_moveItemAtPath_toPath_error_(v9, v40, (uint64_t)v34, v31, &v83);
        v43 = v14;
        v14 = v83;
      }

      APLogForCategory();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if (!v14)
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v58 = objc_msgSend_integerValue(v37, v56, v57);
          *(_DWORD *)buf = 138543618;
          v91 = v34;
          v92 = 2048;
          v93 = v58;
          _os_log_impl(&dword_235C39000, v52, OS_LOG_TYPE_INFO, "Migration of file at path: %{public}@, version: %ld complete.", buf, 0x16u);
        }

        v49 = 0;
        v14 = 0;
        v48 = 1;
        goto LABEL_31;
      }
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_description(v14, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v55;
        _os_log_impl(&dword_235C39000, v52, OS_LOG_TYPE_ERROR, "Error: Replace item error: %{public}@.", buf, 0xCu);

      }
      v48 = 0;
      v49 = 0;
      v50 = 1509;
    }
    else
    {
      APLogForCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v91 = v34;
        _os_log_impl(&dword_235C39000, v38, OS_LOG_TYPE_ERROR, "Error: Node could not be parsed, path %{public}@.", buf, 0xCu);
      }
      v48 = 0;
      v49 = 0;
      v50 = 1508;
    }
    v74 = v50;
LABEL_31:

    if (!v48)
    {

      v11 = v76;
      v6 = v77;
      v9 = v79;
      v15 = v75;
      if (!v49)
        goto LABEL_43;
      goto LABEL_34;
    }
    v11 = v76;
    v6 = v77;
    v9 = v79;
    v15 = v75;
    goto LABEL_33;
  }
LABEL_39:
  v74 = 1200;
LABEL_43:

  return v74;
}

- (void)_sendCoreAnalyticsWithUpdateStatus:(int64_t)a3 version:(int64_t)a4
{
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("ClientConfigVersion");
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v18[1] = CFSTR("StatusCode");
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v8;
  v18[2] = CFSTR("TestingFlag");
  v9 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend__testingFlag(self, v10, v11);
  objc_msgSend_numberWithBool_(v9, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v19, v18, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sendEvent_customPayload_(MEMORY[0x24BDFD478], v17, (uint64_t)CFSTR("ConfigurationSystemRequest"), v16);
}

- (BOOL)_testingFlag
{
  uint64_t v2;
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  char v13;
  char v14;

  if (!objc_msgSend_isAppleInternalInstall(MEMORY[0x24BDFD4B8], a2, v2))
    return 0;
  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v3, v4, *MEMORY[0x24BDFD450]);
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("APConfigurationSystem.testEnvironment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    v13 = objc_msgSend_BOOLValue(v10, v11, v12);
  }
  else
  {
    v10 = (id)MEMORY[0x24BDBD1C0];
    v13 = objc_msgSend_BOOLValue(MEMORY[0x24BDBD1C0], v8, v9);
  }
  v14 = v13;

  return (v14 & 1) != 0;
}

- (int64_t)_configurationVersion
{
  APVersionHelper *v2;
  APVersionData *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  int64_t v8;

  v2 = [APVersionHelper alloc];
  v3 = objc_alloc_init(APVersionData);
  v5 = (void *)objc_msgSend_initWithDatasource_(v2, v4, (uint64_t)v3);

  v8 = objc_msgSend_systemVersion(v5, v6, v7);
  return v8;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (NSString)pathToTempDir
{
  return self->_pathToTempDir;
}

- (NSString)pathToConfig
{
  return self->_pathToConfig;
}

- (NSString)pathToTraverse
{
  return self->_pathToTraverse;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_pathToTraverse, 0);
  objc_storeStrong((id *)&self->_pathToConfig, 0);
  objc_storeStrong((id *)&self->_pathToTempDir, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
