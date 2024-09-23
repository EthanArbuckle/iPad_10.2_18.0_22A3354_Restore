@implementation MXStorageUtil

- (id)_filesFromDirectory:(id)a3 error:(id *)a4
{
  return -[NSFileManager contentsOfDirectoryAtPath:error:](self->_fileManager, "contentsOfDirectoryAtPath:error:", a3, a4);
}

- (MXStorageUtil)init
{
  MXStorageUtil *v2;
  uint64_t v3;
  NSFileManager *fileManager;
  os_log_t v5;
  OS_os_log *logHandle;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MXStorageUtil;
  v2 = -[MXStorageUtil init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = objc_claimAutoreleasedReturnValue();
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v3;

    v5 = os_log_create("com.apple.metrickit", "storage.utility");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v5;

    if (!v2->_logHandle)
      objc_storeStrong((id *)&v2->_logHandle, MEMORY[0x24BDACB70]);
  }
  return v2;
}

- (BOOL)saveData:(id)a3 withFilePath:(id)a4
{
  id v6;
  char v7;
  id v8;
  NSObject *logHandle;
  id v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  uint64_t v18;
  id v19;

  v6 = a4;
  v19 = 0;
  v7 = objc_msgSend(a3, "writeToFile:options:error:", v6, 0x40000000, &v19);
  v8 = v19;
  if (v8)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      -[MXStorageUtil saveData:withFilePath:].cold.4((uint64_t)v6, (uint64_t)v8, logHandle);
  }
  v10 = objc_retainAutorelease(v6);
  v11 = open((const char *)objc_msgSend(v10, "UTF8String"), 0);
  if (v11 < 0)
  {
    v16 = self->_logHandle;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MXStorageUtil saveData:withFilePath:].cold.1((uint64_t)v10, v16);
  }
  else
  {
    v12 = v11;
    v18 = 65605;
    v13 = ffsctl(v11, 0xC0084A44uLL, &v18, 0);
    v14 = self->_logHandle;
    if (v13)
    {
      v15 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MXStorageUtil saveData:withFilePath:].cold.3((uint64_t)v10, v15, v14);
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[MXStorageUtil saveData:withFilePath:].cold.2((uint64_t)v10, v14);
    }
    close(v12);
  }

  return v7;
}

- (id)dataFromPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MXStorageUtil fileManager](self, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsAtPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)removeExistingFilesFromDirectory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v7;

  v4 = a3;
  -[MXStorageUtil _filesFromDirectory:error:](self, "_filesFromDirectory:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  LOBYTE(self) = -[MXStorageUtil _removeFiles:fromDirectory:error:](self, "_removeFiles:fromDirectory:error:", v5, v4, &v7);

  return (char)self;
}

- (void)removeFiles:(id)a3 withFilenameContainsSubstring:(id)a4 fromDirectory:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSFileManager *fileManager;
  void *v19;
  NSObject *logHandle;
  id v21;
  __int128 v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v25;
    *(_QWORD *)&v13 = 138412546;
    v22 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v17, "containsString:", v10, v22))
        {
          fileManager = self->_fileManager;
          objc_msgSend(v11, "stringByAppendingPathComponent:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(fileManager) = -[NSFileManager removeItemAtPath:error:](fileManager, "removeItemAtPath:error:", v19, a6);

          if ((fileManager & 1) == 0)
          {
            logHandle = self->_logHandle;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
            {
              v21 = *a6;
              *(_DWORD *)buf = v22;
              v29 = v17;
              v30 = 2112;
              v31 = v21;
              _os_log_error_impl(&dword_21E837000, logHandle, OS_LOG_TYPE_ERROR, "Failed to remove file %@ with error %@", buf, 0x16u);
            }
          }
        }
      }
      v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v14);
  }

}

- (BOOL)createDirectory:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](self->_fileManager, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, a4);
  if (!v7 && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
    -[MXStorageUtil createDirectory:error:].cold.1();

  return v7;
}

- (BOOL)isDataExistAsDirectoryForPath:(id)a3
{
  BOOL result;
  char v4;

  v4 = 0;
  result = -[NSFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", a3, &v4);
  if (!v4)
    return 0;
  return result;
}

- (id)attributesOfItemAtPath:(id)a3 error:(id *)a4
{
  return -[NSFileManager attributesOfItemAtPath:error:](self->_fileManager, "attributesOfItemAtPath:error:", a3, a4);
}

- (void)setAuthProtectionForPath:(id)a3 fromAttributes:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  NSFileManager *fileManager;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BDD0CF0];
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CF0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDD0CE0];
  v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD0CE0]);

  if ((v10 & 1) == 0)
  {
    fileManager = self->_fileManager;
    v13 = v7;
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSFileManager setAttributes:ofItemAtPath:error:](fileManager, "setAttributes:ofItemAtPath:error:", v12, v6, 0);

  }
}

- (id)archivedDataWithObject:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

- (id)unarchivedObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", a3, a4, a5);
}

- (BOOL)_removeFiles:(id)a3 fromDirectory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[MXStorageUtil _removeFile:error:](self, "_removeFile:error:", v15, a5);

        if (!v16)
        {
          if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_ERROR))
            -[MXStorageUtil _removeFiles:fromDirectory:error:].cold.1();
          v17 = 0;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_13:

  return v17;
}

- (BOOL)_removeFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MXStorageUtil fileManager](self, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "removeItemAtPath:error:", v6, a4);

  return (char)a4;
}

- (NSFileManager)fileManager
{
  return (NSFileManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFileManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)saveData:(uint64_t)a1 withFilePath:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *__error();
  v6 = 138543618;
  v7 = a1;
  v8 = 1024;
  v9 = v4;
  OUTLINED_FUNCTION_3_0(&dword_21E837000, v3, v5, "Failed to open the file %{public}@ with errno %{errno}d hence couldn't mark it purgeable", (uint8_t *)&v6);

}

- (void)saveData:(uint64_t)a1 withFilePath:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_21E837000, a2, OS_LOG_TYPE_DEBUG, "Marked %{public}@ purgeable", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)saveData:(NSObject *)a3 withFilePath:.cold.3(uint64_t a1, int a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  OUTLINED_FUNCTION_3_0(&dword_21E837000, a3, (uint64_t)a3, "Failed to mark %{public}@ purgeable: %{errno}d", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)saveData:(NSObject *)a3 withFilePath:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_21E837000, a2, a3, "Failed to write to file %@ with error %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

- (void)createDirectory:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21E837000, v0, v1, "Failed to create directory at path %@ with error %@");
  OUTLINED_FUNCTION_5();
}

- (void)_removeFiles:fromDirectory:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21E837000, v0, v1, "Failed to remove file %@ with error %@");
  OUTLINED_FUNCTION_5();
}

@end
