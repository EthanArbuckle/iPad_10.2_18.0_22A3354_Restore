@implementation ATXBackupFileManager

- (ATXBackupFileManager)initWithBackupDirectory:(id)a3 dataProviderDelegate:(id)a4
{
  id v7;
  id v8;
  ATXBackupFileManager *v9;
  ATXBackupFileManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXBackupFileManager;
  v9 = -[ATXBackupFileManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backupDirectory, a3);
    objc_storeWeak((id *)&v10->_dataProviderDelegate, v8);
  }

  return v10;
}

- (id)writeBackupFileForDeviceID:(id)a3 pareDown:(BOOL)a4
{
  _BOOL8 v4;
  NSString *v6;
  void *v7;
  NSString *deviceID;
  id WeakRetained;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = (NSString *)a3;
  v7 = (void *)os_transaction_create();
  deviceID = self->_deviceID;
  self->_deviceID = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
  objc_msgSend(WeakRetained, "filenamesAndDataForBackupShouldPareDown:transport:", v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXBackupFileManager writeBackupData:toPath:](self, "writeBackupData:toPath:", v10, CFSTR("ATXBackupData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)commitWithContainerIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/ATXBackupData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("Backups"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

  v9 = -[ATXBackupFileManager writeBackupMarkers:](self, "writeBackupMarkers:", &self->_hdr)
    && -[ATXBackupFileManager writeDeviceID:](self, "writeDeviceID:", self->_deviceID)
    && -[ATXBackupFileManager writeContainerID:](self, "writeContainerID:", v4);

  return v9;
}

- (NSString)deviceID
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/deviceID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v2, 4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)restoreFromBackup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id WeakRetained;
  id v20;

  v4 = a3;
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("ATXLastBackupVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/backupID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtPath:error:", v5, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v8, "copyItemAtPath:toPath:error:", v6, v5, &v20);
  v9 = v20;

  if (v9)
  {
    __atxlog_handle_backup();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager restoreFromBackup:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    if (!v4)
    {
      v17 = 0;
      goto LABEL_6;
    }
    -[ATXBackupFileManager readBackupData:](self, "readBackupData:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
      v17 = objc_msgSend(WeakRetained, "restoreFromBackup:", v10);

      goto LABEL_5;
    }
  }
  v17 = 0;
LABEL_5:

LABEL_6:
  return v17;
}

- (BOOL)isRestoreNeeded
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  BOOL v11;
  NSObject *v12;

  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/backupID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("ATXLastBackupVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v3);

  if ((v6 & 1) == 0)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager isRestoreNeeded].cold.1();

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v4);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "contentsEqualAtPath:andPath:", v3, v4);

    if ((v10 & 1) != 0)
    {
LABEL_8:
      v11 = 0;
      goto LABEL_9;
    }
  }
  v11 = 1;
LABEL_9:

  return v11;
}

- (id)containerIDForCloudKitRestore
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;

  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/containerID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v2, 4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager containerIDForCloudKitRestore].cold.1();

    v5 = 0;
  }

  return v5;
}

- (BOOL)writeBackupFileForD2D
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("D2DBackups"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

  -[ATXBackupFileManager dataProviderDelegate](self, "dataProviderDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filenamesAndDataForBackupShouldPareDown:transport:", 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXBackupFileManager writeBackupData:toPath:](self, "writeBackupData:toPath:", v7, CFSTR("/D2DBackups/ATXBackupData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &self->_hdr, 16);
    -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("ATXD2DLastBackupVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ATXBackupFileManager writeData:toPath:](self, "writeData:toPath:", v9, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)restoreFromD2D
{
  id v3;
  FILE *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  LODWORD(v15) = 0;
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/D2DBackups/ATXBackupData"), 0, 0, v15, v16);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = fopen((const char *)objc_msgSend(v3, "UTF8String"), "r");

  if (!v4)
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager restoreFromD2D].cold.1();

    return 0;
  }
  if (fread(&v14, 0x14uLL, 1uLL, v4) != 1)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager restoreFromD2D].cold.2();

    fclose(v4);
    return 0;
  }
  fclose(v4);
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("ATXD2DLastBackupVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v14, 16);
  -[ATXBackupFileManager writeData:toPath:](self, "writeData:toPath:", v6, v5);
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/D2DBackups/ATXBackupData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBackupFileManager readBackupData:](self, "readBackupData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
    v10 = objc_msgSend(WeakRetained, "restoreFromBackup:", v8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isD2DRestoreNeeded
{
  ATXBackupFileManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/D2DBackups/ATXBackupData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBackupFileManager pathForFile:](v2, "pathForFile:", CFSTR("ATXD2DLastBackupVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[ATXBackupFileManager compareBackupIDFromBackupWithPath:toMarkerWithPath:](v2, "compareBackupIDFromBackupWithPath:toMarkerWithPath:", v3, v4);

  return (char)v2;
}

- (BOOL)restoreFromMobileBackup
{
  id v3;
  FILE *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  LODWORD(v15) = 0;
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/ATXBackupData"), 0, 0, v15, v16);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = fopen((const char *)objc_msgSend(v3, "UTF8String"), "r");

  if (!v4)
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager restoreFromD2D].cold.1();

    return 0;
  }
  if (fread(&v14, 0x14uLL, 1uLL, v4) != 1)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager restoreFromD2D].cold.2();

    fclose(v4);
    return 0;
  }
  fclose(v4);
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("ATXLastBackupVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v14, 16);
  -[ATXBackupFileManager writeData:toPath:](self, "writeData:toPath:", v6, v5);
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/ATXBackupData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBackupFileManager readBackupData:](self, "readBackupData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
    v10 = objc_msgSend(WeakRetained, "restoreFromBackup:", v8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isMobileBackupRestoreNeeded
{
  ATXBackupFileManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/ATXBackupData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBackupFileManager pathForFile:](v2, "pathForFile:", CFSTR("ATXLastBackupVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[ATXBackupFileManager compareBackupIDFromBackupWithPath:toMarkerWithPath:](v2, "compareBackupIDFromBackupWithPath:toMarkerWithPath:", v3, v4);

  return (char)v2;
}

- (BOOL)writeBackupMarkers:(const char *)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("ATXLastBackupVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/backupID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, 16);
  if (-[ATXBackupFileManager writeData:toPath:](self, "writeData:toPath:", v7, v5))
    v8 = -[ATXBackupFileManager writeData:toPath:](self, "writeData:toPath:", v7, v6);
  else
    v8 = 0;

  return v8;
}

- (BOOL)writeDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/deviceID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ATXBackupFileManager writeData:toPath:](self, "writeData:toPath:", v6, v5);

  }
  else
  {
    __atxlog_handle_backup();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager writeDeviceID:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (BOOL)writeContainerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("/Backups/containerID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ATXBackupFileManager writeData:toPath:](self, "writeData:toPath:", v6, v5);

  }
  else
  {
    __atxlog_handle_backup();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager writeContainerID:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (BOOL)compareBackupIDFromBackupWithPath:(id)a3 toMarkerWithPath:(id)a4
{
  id v5;
  FILE *v6;
  FILE *v7;
  void *v8;
  NSObject *v9;
  _QWORD *v10;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint64_t __ptr;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = fopen((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), "r");
  if (v6)
  {
    v7 = v6;
    __ptr = 0;
    v18 = 0;
    v19 = 0;
    v16 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 0, &v16);
    v9 = v16;
    if (fread(&__ptr, 0x14uLL, 1uLL, v7) == 1)
    {
      if (!v8)
      {
LABEL_9:
        v12 = 1;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      if (objc_msgSend(v8, "length") == 16)
      {
        v10 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
        if (*v10 != __ptr || v10[1] != v18)
          goto LABEL_9;
      }
      else
      {
        __atxlog_handle_default();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[ATXBackupFileManager compareBackupIDFromBackupWithPath:toMarkerWithPath:].cold.2();

        unlink((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
      }
    }
    else
    {
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXBackupFileManager restoreFromD2D].cold.2();

    }
    fclose(v7);
    v12 = 0;
    goto LABEL_22;
  }
  if (*__error() != 2)
  {
    __atxlog_handle_backup();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager compareBackupIDFromBackupWithPath:toMarkerWithPath:].cold.1();
    v12 = 0;
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (id)writeBackupData:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __sFILE *v9;
  FILE *v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  void (**v30)(_QWORD);
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD aBlock[4];
  id v37;
  __sFILE *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    arc4random_buf(&self->_hdr, 0x10uLL);
    self->_hdr.chunkCount = objc_msgSend(v6, "count");
    -[ATXBackupFileManager pathForFile:](self, "pathForFile:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXBackupFileManager openBackupFileForWriting:](self, "openBackupFileForWriting:", v8);
    if (v9)
    {
      v10 = v9;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __47__ATXBackupFileManager_writeBackupData_toPath___block_invoke;
      aBlock[3] = &unk_1E82DC688;
      v38 = v9;
      v11 = v8;
      v37 = v11;
      v12 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (fwrite(&self->_hdr, 0x14uLL, 1uLL, v10) == 1)
      {
        v29 = v11;
        v30 = v12;
        v31 = v8;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v6, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v33;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v6, "objectForKeyedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v19) = -[ATXBackupFileManager writeChunk:withFilename:toBackupFile:](self, "writeChunk:withFilename:toBackupFile:", v20, v19, v10);

              if ((v19 & 1) == 0)
              {
                __atxlog_handle_backup();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  -[ATXBackupFileManager writeBackupData:toPath:].cold.1();

                v12 = v30;
                v30[2](v30);

                v25 = 0;
                v8 = v31;
                goto LABEL_21;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
            if (v16)
              continue;
            break;
          }
        }

        fclose(v10);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("Backups/AppPredictionExpert"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeItemAtPath:error:", v22, 0);

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXBackupFileManager pathForFile:](self, "pathForFile:", CFSTR("Backups/backup_version"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "removeItemAtPath:error:", v24, 0);

        v25 = v29;
        v12 = v30;
        v8 = v31;
      }
      else
      {
        __atxlog_handle_backup();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[ATXBackupFileManager writeBackupData:toPath:].cold.1();

        v12[2](v12);
        v25 = 0;
      }
LABEL_21:

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

uint64_t __47__ATXBackupFileManager_writeBackupData_toPath___block_invoke(uint64_t a1)
{
  FILE *v2;

  v2 = *(FILE **)(a1 + 40);
  if (v2)
    fclose(v2);
  return unlink((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
}

- (BOOL)writeChunk:(id)a3 withFilename:(id)a4 toBackupFile:(__sFILE *)a5
{
  id v7;
  const char *v8;
  void *v9;
  const void *v10;
  BOOL v11;
  unsigned int __ptr;

  v7 = a3;
  v8 = (const char *)objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  __ptr = strlen(v8);
  if (fwrite(&__ptr, 4uLL, 1uLL, a5) == 1 && fwrite(v8, __ptr, 1uLL, a5) == 1)
  {
    objc_msgSend(MEMORY[0x1E0D81560], "compress:lowMemory:", v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __ptr = objc_msgSend(v9, "length");
    if (fwrite(&__ptr, 4uLL, 1uLL, a5) == 1)
    {
      v10 = (const void *)objc_msgSend(objc_retainAutorelease(v9), "bytes");
      v11 = fwrite(v10, __ptr, 1uLL, a5) == 1;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (__sFILE)openBackupFileForWriting:(id)a3
{
  int v3;
  FILE *v4;
  NSObject *v5;

  v3 = open_dprotected_np((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 1537, 3, 0, 384);
  v4 = fdopen(v3, "w");
  if (!v4)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager openBackupFileForWriting:].cold.1();

    close(v3);
  }
  return v4;
}

- (id)readBackupData:(id)a3
{
  id v4;
  FILE *v5;
  FILE *v6;
  void (**v7)(_QWORD);
  void *v8;
  int v9;
  void *v10;
  size_t v11;
  void *v12;
  void *v13;
  void *v14;
  size_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void (**v25)(_QWORD);
  unsigned int __ptr;
  _QWORD aBlock[5];

  v4 = objc_retainAutorelease(a3);
  v5 = fopen((const char *)objc_msgSend(v4, "UTF8String"), "r");
  if (v5)
  {
    v6 = v5;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__ATXBackupFileManager_readBackupData___block_invoke;
    aBlock[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    aBlock[4] = v5;
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (fread(&self->_hdr, 0x14uLL, 1uLL, v6) == 1)
    {
      v25 = v7;
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      if (self->_hdr.chunkCount)
      {
        v9 = 0;
        while (1)
        {
          v10 = (void *)MEMORY[0x1CAA48B6C]();
          __ptr = 0;
          if (fread(&__ptr, 4uLL, 1uLL, v6) != 1)
            goto LABEL_16;
          v11 = __ptr;
          v12 = malloc_type_calloc(__ptr + 1, 1uLL, 0x100004077774924uLL);
          v13 = v12;
          if (!v12 || fread(v12, v11, 1uLL, v6) != 1)
          {
            free(v13);
LABEL_16:
            v7 = v25;
            v25[2](v25);
            v23 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_19;
          }
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v13, v11, 4, 1);
          if (fread(&__ptr, 4uLL, 1uLL, v6) != 1)
            goto LABEL_18;
          v15 = __ptr;
          v16 = malloc_type_malloc(__ptr, 0x279605E1uLL);
          v17 = v16;
          if (!v16 || fread(v16, v15, 1uLL, v6) != 1)
            break;
          v18 = v8;
          v19 = (void *)MEMORY[0x1E0D81560];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v17, v15);
          v21 = v19;
          v8 = v18;
          objc_msgSend(v21, "decompress:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, v14);
          objc_autoreleasePoolPop(v10);
          if (++v9 >= self->_hdr.chunkCount)
            goto LABEL_12;
        }
        free(v17);
LABEL_18:
        v7 = v25;
        v25[2](v25);
        v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
        objc_autoreleasePoolPop(v10);
      }
      else
      {
LABEL_12:
        fclose(v6);
        v23 = v8;
        v7 = v25;
      }

    }
    else
    {
      v7[2](v7);
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __39__ATXBackupFileManager_readBackupData___block_invoke(uint64_t a1)
{
  FILE *v1;
  NSObject *v2;

  v1 = *(FILE **)(a1 + 32);
  if (v1)
    fclose(v1);
  __atxlog_handle_backup();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[ATXBackupFileManager restoreFromD2D].cold.2();

  return 0;
}

- (BOOL)writeData:(id)a3 toPath:(id)a4
{
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  v14 = 0;
  v4 = objc_msgSend(a3, "writeToFile:options:error:", a4, 0, &v14);
  v5 = v14;
  if ((v4 & 1) == 0)
  {
    __atxlog_handle_backup();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXBackupFileManager writeData:toPath:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

- (id)pathForFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ATXBackupFileManager backupDirectory](self, "backupDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ATXBackupDataProviderDelegate)dataProviderDelegate
{
  return (ATXBackupDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
}

- (void)setDataProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dataProviderDelegate, a3);
}

- (NSString)backupDirectory
{
  return self->_backupDirectory;
}

- (void)setBackupDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_backupDirectory, a3);
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_backupDirectory, 0);
  objc_destroyWeak((id *)&self->_dataProviderDelegate);
}

- (void)restoreFromBackup:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Error occurred while writing marker file: %@", a5, a6, a7, a8, 2u);
}

- (void)isRestoreNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "backupID file does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)containerIDForCloudKitRestore
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "containerID file does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)restoreFromD2D
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_5();
  v0 = OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_4_10(v0);
  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0_17(&dword_1C9A3B000, v1, v2, "Error reading from backup file [%i]: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)writeDeviceID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Device ID was null or empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)writeContainerID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "container ID was null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)compareBackupIDFromBackupWithPath:toMarkerWithPath:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_5();
  v0 = OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_4_10(v0);
  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0_17(&dword_1C9A3B000, v1, v2, "Error opening backup file %i: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)compareBackupIDFromBackupWithPath:toMarkerWithPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Backup marker file truncated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)writeBackupData:toPath:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_5();
  v0 = OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_4_10(v0);
  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0_17(&dword_1C9A3B000, v1, v2, "Error writing to backup file [%i]: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)openBackupFileForWriting:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_5();
  v0 = OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_4_10(v0);
  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0_17(&dword_1C9A3B000, v1, v2, "Could not fdopen backup fd [%i]: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)writeData:(uint64_t)a3 toPath:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Could not write data to file: %@", a5, a6, a7, a8, 2u);
}

@end
