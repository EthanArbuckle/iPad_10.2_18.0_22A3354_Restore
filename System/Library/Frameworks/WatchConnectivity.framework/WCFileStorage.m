@implementation WCFileStorage

void __31__WCFileStorage_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

- (WCFileStorage)init
{
  WCFileStorage *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *fileQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCFileStorage;
  v2 = -[WCFileStorage init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.private.watchconnectivity.file-storage-queue", 0);
    fileQueue = v2->_fileQueue;
    v2->_fileQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WCFileStorage_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_instance;
}

- (void)createWatchDirectoryIfNeeded:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  char v15;

  v3 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v15);

  if (v6)
  {
    if (v15)
    {
LABEL_12:
      v12 = 0;
      goto LABEL_13;
    }
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WCFileStorage createWatchDirectoryIfNeeded:].cold.2(v7, v8, v9);

    WCDeleteItemAtURL(v3);
  }
  if (!v3)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v14);
  v12 = v14;

  if ((v11 & 1) == 0 && v12)
  {
    wc_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WCFileStorage createWatchDirectoryIfNeeded:].cold.1(v3);

  }
LABEL_13:

}

- (void)setPairingID:(id)a3
{
  NSString *v4;
  NSString *pairingID;
  id v6;

  v6 = a3;
  if ((-[NSString isEqual:](self->_pairingID, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    pairingID = self->_pairingID;
    self->_pairingID = v4;

    -[WCFileStorage resetIndexes](self, "resetIndexes");
  }

}

- (void)resetIndexes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WCFileStorage fileIndex](self, "fileIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[WCFileStorage setFileIndex:](self, "setFileIndex:", 0);
  -[WCFileStorage fileResultsIndex](self, "fileResultsIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[WCFileStorage setFileResultsIndex:](self, "setFileResultsIndex:", 0);
  -[WCFileStorage userInfoIndex](self, "userInfoIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[WCFileStorage setUserInfoIndex:](self, "setUserInfoIndex:", 0);
  -[WCFileStorage userInfoResultsIndex](self, "userInfoResultsIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[WCFileStorage setUserInfoResultsIndex:](self, "setUserInfoResultsIndex:", 0);
}

- (id)loadOutstandingFileTransfers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF48];
  -[WCFileStorage outgoingFileTransferPath](self, "outgoingFileTransferPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = *MEMORY[0x24BDBCC98];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, v5, 4, &__block_literal_global_3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "nextObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", CFSTR("file-transfer-data"));

      if (v12)
      {
        v13 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(v10, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dataWithContentsOfFile:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = (void *)MEMORY[0x24BDD1620];
          v17 = objc_opt_class();
          v27 = 0;
          objc_msgSend(v16, "unarchivedObjectOfClass:fromData:error:", v17, v15, &v27);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v27;
          if (v18)
          {
            objc_msgSend(v18, "transferIdentifier");
            v20 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v20);
          }
          else
          {
            wc_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v10, "path");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v19;
              NSPrintF();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446722;
              v29 = "-[WCFileStorage loadOutstandingFileTransfers]";
              v30 = 2114;
              v31 = v26;
              v32 = 2114;
              v33 = v25;
              _os_log_error_impl(&dword_216F21000, v20, OS_LOG_TYPE_ERROR, "%{public}s could not unarchive file at path %{public}@ due to %{public}@", buf, 0x20u);

            }
          }

        }
        else
        {
          wc_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v10, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446466;
            v29 = "-[WCFileStorage loadOutstandingFileTransfers]";
            v30 = 2114;
            v31 = v21;
            _os_log_error_impl(&dword_216F21000, v19, OS_LOG_TYPE_ERROR, "%{public}s could not find file at path %{public}@", buf, 0x16u);

          }
        }

      }
      objc_msgSend(v7, "nextObject", v24);
      v22 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v22;
    }
    while (v22);
  }

  return v8;
}

uint64_t __45__WCFileStorage_loadOutstandingFileTransfers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (objc_msgSend(v3, "code") != -1100 && objc_msgSend(v3, "code") != 260)
  {
    wc_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__WCFileStorage_loadOutstandingFileTransfers__block_invoke_cold_1();

  }
  return 1;
}

- (void)persistOutgoingFileTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;

  v4 = a3;
  -[WCFileStorage outgoingFileTransferPath](self, "outgoingFileTransferPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage appendPathForFileTransfer:toPath:](self, "appendPathForFileTransfer:toPath:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v16);
  v8 = v16;

  if (v8)
  {
    wc_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WCFileStorage persistOutgoingFileTransfer:].cold.3();
  }
  else
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v15);
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (v9)
    {
      objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("file-transfer-data"));
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v12 = -[NSObject writeToURL:options:error:](v9, "writeToURL:options:error:", v11, 1073741825, &v14);
      v8 = v14;
      if ((v12 & 1) == 0)
      {
        wc_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[WCFileStorage persistOutgoingFileTransfer:].cold.2();

      }
    }
    else
    {
      wc_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WCFileStorage persistOutgoingFileTransfer:].cold.1();
    }

  }
}

- (void)deleteOutstandingFileTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  -[WCFileStorage outgoingFileTransferPath](self, "outgoingFileTransferPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage appendPathForFileTransfer:toPath:](self, "appendPathForFileTransfer:toPath:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = objc_msgSend(v7, "removeItemAtPath:error:", v6, &v11);
  v9 = v11;

  if ((v8 & 1) == 0
    && objc_msgSend(v9, "code") != -1100
    && objc_msgSend(v9, "code") != 260
    && objc_msgSend(v9, "code") != 4)
  {
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WCFileStorage deleteOutstandingFileTransfer:].cold.1();

  }
}

- (id)persistOutgoingUserInfoTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  void *v18;
  NSObject *v19;
  char v20;
  NSObject *v21;
  id v23;
  id v24;
  id v25;
  id v26;

  v4 = a3;
  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WCUserInfoTransfersInContainer((uint64_t)v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "transferIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v26);
  v12 = v26;

  if (v11)
  {
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("userinfo-transfer-object-data"), 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v25 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;
    v12 = v15;
    if (v14)
    {
      v24 = v15;
      v16 = objc_msgSend(v14, "writeToURL:options:error:", v13, 1073741825, &v24);
      v17 = v24;

      if (!v16)
      {
        wc_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[WCFileStorage persistOutgoingUserInfoTransfer:].cold.3();
        v18 = 0;
        v12 = v17;
        goto LABEL_17;
      }
      objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("userinfo-transfer-wire-data"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "protobufData");
      v19 = objc_claimAutoreleasedReturnValue();
      v23 = v17;
      v20 = -[NSObject writeToURL:options:error:](v19, "writeToURL:options:error:", v18, 1073741825, &v23);
      v12 = v23;

      if ((v20 & 1) != 0)
      {
LABEL_17:

        goto LABEL_18;
      }

      wc_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[WCFileStorage persistOutgoingUserInfoTransfer:].cold.2();

    }
    else
    {
      wc_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[WCFileStorage persistOutgoingUserInfoTransfer:].cold.1();
    }
    v18 = 0;
    goto LABEL_17;
  }
  wc_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[WCFileStorage persistOutgoingUserInfoTransfer:].cold.4();
  v18 = 0;
LABEL_18:

  return v18;
}

- (id)loadOutstandingUserInfoTransfersAndComplicationUserInfo:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WCUserInfoTransfersInContainer((uint64_t)v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v40[0] = *MEMORY[0x24BDBCC98];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v7;
  objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v8, 4, &__block_literal_global_11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "nextObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    do
    {
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", CFSTR("userinfo-transfer-object-data"));

      if (v15)
      {
        v16 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(v13, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dataWithContentsOfFile:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = (void *)MEMORY[0x24BDD1620];
          v20 = objc_opt_class();
          v33 = 0;
          objc_msgSend(v19, "unarchivedObjectOfClass:fromData:error:", v20, v18, &v33);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v33;
          if (v21)
          {
            objc_msgSend(v21, "transferIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v23);

            v24 = objc_msgSend(v21, "isCurrentComplicationInfo");
            if (a3 && v24)
              *a3 = objc_retainAutorelease(v21);
          }
          else
          {
            wc_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "path");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v22;
              NSPrintF();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446722;
              v35 = "-[WCFileStorage loadOutstandingUserInfoTransfersAndComplicationUserInfo:]";
              v36 = 2114;
              v37 = v31;
              v38 = 2114;
              v39 = v30;
              _os_log_error_impl(&dword_216F21000, v26, OS_LOG_TYPE_ERROR, "%{public}s could not unarchive user info at path %{public}@ due to %{public}@", buf, 0x20u);

            }
          }

        }
        else
        {
          wc_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "path");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446466;
            v35 = "-[WCFileStorage loadOutstandingUserInfoTransfersAndComplicationUserInfo:]";
            v36 = 2114;
            v37 = v25;
            _os_log_error_impl(&dword_216F21000, v22, OS_LOG_TYPE_ERROR, "%{public}s could not find file at path %{public}@", buf, 0x16u);

          }
        }

      }
      objc_msgSend(v10, "nextObject", v29);
      v27 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v27;
    }
    while (v27);
  }

  return v11;
}

uint64_t __73__WCFileStorage_loadOutstandingUserInfoTransfersAndComplicationUserInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (objc_msgSend(v3, "code") != -1100 && objc_msgSend(v3, "code") != 260)
  {
    wc_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__WCFileStorage_loadOutstandingUserInfoTransfersAndComplicationUserInfo___block_invoke_cold_1();

  }
  return 1;
}

- (void)deleteOutstandingUserInfoTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;

  v4 = a3;
  -[WCFileStorage pairingID](self, "pairingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCFileStorage pairingID](self, "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WCUserInfoTransfersInContainer((uint64_t)v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "transferIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    LOBYTE(v9) = -[WCFileStorage removeItemAtURL:numberOfRetries:error:](self, "removeItemAtURL:numberOfRetries:error:", v10, 5, &v14);
    v11 = v14;
    v12 = v11;
    if ((v9 & 1) == 0
      && objc_msgSend(v11, "code") != -1100
      && objc_msgSend(v12, "code") != 260
      && objc_msgSend(v12, "code") != 4)
    {
      wc_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[WCFileStorage deleteOutstandingUserInfoTransfer:].cold.1();

    }
  }

}

- (void)enumerateFileTransferResultsWithBlock:(id)a3
{
  void (**v4)(id, void *, _QWORD, uint8_t *);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WCContentIndex *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void (**v42)(id, void *, _QWORD, uint8_t *);
  void *v43;
  id obj;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *log;
  uint8_t v49;
  char v50[15];
  id v51;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  _QWORD v65[3];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD, uint8_t *))a3;
  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WCFileTransfersURLInContainer((uint64_t)v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v7;
  -[WCFileStorage fileResultsIndex](self, "fileResultsIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = -[WCContentIndex initWithContainingFolder:]([WCContentIndex alloc], "initWithContainingFolder:", v7);
    -[WCFileStorage setFileResultsIndex:](self, "setFileResultsIndex:", v10);

  }
  -[WCFileStorage fileResultsIndex](self, "fileResultsIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "index");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v12;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v56;
    v42 = v4;
    v43 = (void *)v7;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v56 != v46)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v13);
        wc_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v60 = "-[WCFileStorage enumerateFileTransferResultsWithBlock:]";
          v61 = 2114;
          v62 = v14;
          _os_log_impl(&dword_216F21000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
        }

        objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v14, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("file-transfer-result"), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(v17, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0;
        objc_msgSend(v18, "dataWithContentsOfFile:options:error:", v19, 2, &v54);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v54;

        if (v20)
        {
          v22 = (void *)MEMORY[0x24BDBCF20];
          v65[0] = objc_opt_class();
          v65[1] = objc_opt_class();
          v65[2] = objc_opt_class();
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setWithArray:", v23);
          v24 = objc_claimAutoreleasedReturnValue();

          v53 = 0;
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v24, v20, &v53);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v53;
          if (v25)
          {
            v45 = v25;
            objc_msgSend(v17, "URLByDeletingLastPathComponent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "URLByAppendingPathComponent:isDirectory:", CFSTR("file-transfer-data"), 0);
            v27 = objc_claimAutoreleasedReturnValue();

            v28 = (void *)MEMORY[0x24BDBCE50];
            log = v27;
            -[NSObject path](v27, "path");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = 0;
            objc_msgSend(v28, "dataWithContentsOfFile:options:error:", v29, 2, &v52);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v52;

            v31 = v14;
            if (v30)
            {

              v32 = (void *)MEMORY[0x24BDD1620];
              v33 = objc_opt_class();
              v51 = 0;
              objc_msgSend(v32, "unarchivedObjectOfClass:fromData:error:", v33, v30, &v51);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v51;
              if (v34)
              {
                objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("WCFileTransferResultError"));
                v35 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setTransferError:", v35);
                goto LABEL_24;
              }
              wc_log();
              v35 = objc_claimAutoreleasedReturnValue();
              v8 = v43;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                NSPrintF();
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136446722;
                v60 = "-[WCFileStorage enumerateFileTransferResultsWithBlock:]";
                v61 = 2114;
                v62 = v31;
                v63 = 2114;
                v64 = v40;
                _os_log_error_impl(&dword_216F21000, v35, OS_LOG_TYPE_ERROR, "%{public}s could not unarchive file %{public}@ due to %{public}@", buf, 0x20u);

                v8 = v43;
              }
              v34 = 0;
            }
            else
            {
              objc_msgSend(v17, "URLByDeletingLastPathComponent");
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              WCDeleteItemAtURL(v36);
              wc_log();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                -[WCFileStorage enumerateFileTransferResultsWithBlock:].cold.1(&v49, v50, v35);
              v34 = 0;
              v17 = v36;
LABEL_24:
              v8 = v43;
            }

            v4 = v42;
            v25 = v45;
          }
          else
          {
            wc_log();
            log = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              NSPrintF();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446722;
              v60 = "-[WCFileStorage enumerateFileTransferResultsWithBlock:]";
              v61 = 2114;
              v31 = v14;
              v62 = v14;
              v63 = 2114;
              v64 = v39;
              _os_log_error_impl(&dword_216F21000, log, OS_LOG_TYPE_ERROR, "%{public}s could not unarchive results %{public}@ due to %{public}@", buf, 0x20u);

              v25 = 0;
            }
            else
            {
              v31 = v14;
            }
            v34 = 0;
          }

          goto LABEL_30;
        }
        v31 = v14;
        wc_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "path");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v60 = "-[WCFileStorage enumerateFileTransferResultsWithBlock:]";
          v61 = 2114;
          v62 = v38;
          _os_log_error_impl(&dword_216F21000, v24, OS_LOG_TYPE_ERROR, "%{public}s could not load file data at path %{public}@", buf, 0x16u);

        }
        v34 = 0;
LABEL_30:

        buf[0] = 0;
        ((void (**)(id, void *, void *, uint8_t *))v4)[2](v4, v34, v31, buf);
        v37 = buf[0];

        if (v37)
          goto LABEL_35;
        ++v13;
      }
      while (v47 != v13);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
      v47 = v41;
    }
    while (v41);
  }
LABEL_35:

}

- (void)persistAppContextData:(id)a3 received:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;

  v4 = a4;
  v6 = a3;
  -[WCFileStorage appContextFolderURL:](self, "appContextFolderURL:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("context"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v16);
  v11 = v16;

  if (!v10)
  {
    wc_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[WCFileStorage persistAppContextData:received:].cold.2();
    v13 = v11;
    goto LABEL_8;
  }
  v15 = v11;
  v12 = objc_msgSend(v6, "writeToURL:options:error:", v8, 1073741825, &v15);
  v13 = v15;

  if ((v12 & 1) == 0)
  {
    wc_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[WCFileStorage persistAppContextData:received:].cold.1();
LABEL_8:

  }
}

- (id)loadAppContextReceived:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v12;
  id v13;

  -[WCFileStorage appContextFolderURL:](self, "appContextFolderURL:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("context"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v4, 0, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  v7 = v6;
  if (v5)
  {
    v12 = v6;
    WCDeserializePayloadData(v5, &v12);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (!v9)
    {
      v7 = 0;
      goto LABEL_13;
    }
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WCFileStorage loadAppContextReceived:].cold.2();

  }
  else
  {
    if (!v6 || objc_msgSend(v6, "code") == -1100 || objc_msgSend(v7, "code") == 260 || objc_msgSend(v7, "code") == 4)
    {
      v8 = MEMORY[0x24BDBD1B8];
      goto LABEL_13;
    }
    wc_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WCFileStorage loadAppContextReceived:].cold.1();
    v9 = v7;
  }

  v8 = MEMORY[0x24BDBD1B8];
  v7 = v9;
LABEL_13:

  return v8;
}

- (void)deleteAppContextReceived:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;

  v3 = a3;
  -[WCFileStorage pairingID](self, "pairingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WCFileStorage appContextFolderURL:](self, "appContextFolderURL:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v7 = -[WCFileStorage removeItemAtURL:numberOfRetries:error:](self, "removeItemAtURL:numberOfRetries:error:", v6, 5, &v11);
    v8 = v11;
    v9 = v8;
    if (!v7 && objc_msgSend(v8, "code") != -1100 && objc_msgSend(v9, "code") != 260 && objc_msgSend(v9, "code") != 4)
    {
      wc_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WCFileStorage deleteAppContextReceived:].cold.1();

    }
  }
}

- (id)loadAppContextDataFromInbox
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;

  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WCInboxAppContextFolderURLInContainer((uint64_t)v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("context"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v6, 0, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "code") != -1100 && objc_msgSend(v9, "code") != 260 && objc_msgSend(v9, "code") != 4)
  {
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WCFileStorage loadAppContextDataFromInbox].cold.1();

  }
  return v7;
}

- (void)deleteAppContextDataFromInbox
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_28();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v0;
  NSPrintF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v4, v5, "%{public}s couldn't delete application context from inbox %{public}@ %{public}@", v6, v7, v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)enumerateIncomingFilesWithBlock:(id)a3
{
  void (**v4)(id, void *, _QWORD, uint8_t *);
  void *v5;
  void *v6;
  void *v7;
  WCContentIndex *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD, uint8_t *))a3;
  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WCSessionFilesURLInContainer((uint64_t)v5, v6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[WCFileStorage fileIndex](self, "fileIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[WCContentIndex initWithContainingFolder:]([WCContentIndex alloc], "initWithContainingFolder:", v32);
    -[WCFileStorage setFileIndex:](self, "setFileIndex:", v8);

  }
  -[WCFileStorage fileIndex](self, "fileIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "index");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v11)
  {
    v12 = v11;
    v31 = *(_QWORD *)v36;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
        wc_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v40 = "-[WCFileStorage enumerateIncomingFilesWithBlock:]";
          v41 = 2114;
          v42 = v14;
          _os_log_impl(&dword_216F21000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
        }

        objc_msgSend(v32, "URLByAppendingPathComponent:isDirectory:", v14, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("session-file-data"), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(v17, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        objc_msgSend(v18, "dataWithContentsOfFile:options:error:", v19, 2, &v34);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v34;

        if (v20)
        {

          v22 = (void *)MEMORY[0x24BDD1620];
          v23 = objc_opt_class();
          v33 = 0;
          objc_msgSend(v22, "unarchivedObjectOfClass:fromData:error:", v23, v20, &v33);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v33;
          if (v24)
            goto LABEL_17;
          wc_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            NSPrintF();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446722;
            v40 = "-[WCFileStorage enumerateIncomingFilesWithBlock:]";
            v41 = 2114;
            v42 = v14;
            v43 = 2114;
            v44 = v26;
            _os_log_error_impl(&dword_216F21000, v25, OS_LOG_TYPE_ERROR, "%{public}s couldn't unarchive file %{public}@ due to %{public}@", buf, 0x20u);

          }
        }
        else
        {
          wc_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v17, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            NSPrintF();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446722;
            v40 = "-[WCFileStorage enumerateIncomingFilesWithBlock:]";
            v41 = 2114;
            v42 = v28;
            v43 = 2114;
            v44 = v29;
            _os_log_error_impl(&dword_216F21000, v25, OS_LOG_TYPE_ERROR, "%{public}s could not load file data at path %{public}@ due to %{public}@", buf, 0x20u);

          }
        }

        v24 = 0;
LABEL_17:
        buf[0] = 0;
        ((void (**)(id, void *, void *, uint8_t *))v4)[2](v4, v24, v14, buf);
        v27 = buf[0];

        if (v27)
          goto LABEL_20;
        ++v13;
      }
      while (v12 != v13);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v12);
  }
LABEL_20:

}

- (void)cleanupSessionFileFromInbox:(id)a3
{
  id v4;

  v4 = a3;
  -[WCFileStorage deleteRelatedMetadataForSessionFileFromInbox:](self, "deleteRelatedMetadataForSessionFileFromInbox:", v4);
  -[WCFileStorage deleteFileFolderForSessionFileFromInbox:](self, "deleteFileFolderForSessionFileFromInbox:", v4);

}

- (void)deleteRelatedMetadataForSessionFileFromInbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WCSessionFilesURLInContainer((uint64_t)v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fileIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  LOBYTE(v8) = -[WCFileStorage removeItemAtURL:numberOfRetries:error:](self, "removeItemAtURL:numberOfRetries:error:", v9, 5, &v14);
  v10 = v14;
  if ((v8 & 1) == 0)
  {
    wc_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v16 = "-[WCFileStorage deleteRelatedMetadataForSessionFileFromInbox:]";
      v17 = 2114;
      v18 = v4;
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_216F21000, v11, OS_LOG_TYPE_ERROR, "%{public}s couldn't delete persistent session file %{public}@ %{public}@ %{public}@", buf, 0x2Au);

    }
  }

}

- (void)deleteFileFolderForSessionFileFromInbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WCTransferredFilesURLInContainer((uint64_t)v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fileIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  LOBYTE(v8) = -[WCFileStorage removeItemAtURL:numberOfRetries:error:](self, "removeItemAtURL:numberOfRetries:error:", v9, 5, &v14);
  v10 = v14;
  if ((v8 & 1) == 0)
  {
    wc_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSPrintF();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v16 = "-[WCFileStorage deleteFileFolderForSessionFileFromInbox:]";
      v17 = 2114;
      v18 = v4;
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_216F21000, v11, OS_LOG_TYPE_ERROR, "%{public}s couldn't delete file folder %{public}@ %{public}@ %{public}@", buf, 0x2Au);

    }
  }

}

- (void)enumerateIncomingUserInfosWithBlock:(id)a3
{
  void (**v4)(id, void *, _QWORD, uint8_t *);
  void *v5;
  void *v6;
  void *v7;
  WCContentIndex *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD, uint8_t *))a3;
  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WCTransferredUserInfoInboxURLInContainer((uint64_t)v5, v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[WCFileStorage userInfoIndex](self, "userInfoIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = -[WCContentIndex initWithContainingFolder:]([WCContentIndex alloc], "initWithContainingFolder:", v34);
    -[WCFileStorage setUserInfoIndex:](self, "setUserInfoIndex:", v8);

  }
  -[WCFileStorage userInfoIndex](self, "userInfoIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "index");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v11)
  {
    v12 = v11;
    v33 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v34, "URLByAppendingPathComponent:isDirectory:", v14, 1, v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", CFSTR("userinfo-transfer-object-data"), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)MEMORY[0x24BDBCE50];
        objc_msgSend(v16, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        objc_msgSend(v17, "dataWithContentsOfFile:options:error:", v18, 2, &v36);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v36;

        if (!v19)
        {
          wc_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v16, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v20;
            NSPrintF();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446722;
            v42 = "-[WCFileStorage enumerateIncomingUserInfosWithBlock:]";
            v43 = 2114;
            v44 = v28;
            v45 = 2114;
            v46 = v31;
            _os_log_error_impl(&dword_216F21000, v26, OS_LOG_TYPE_ERROR, "%{public}s could not load user info data at path %{public}@ due to %{public}@", buf, 0x20u);

          }
          goto LABEL_17;
        }

        v21 = (void *)MEMORY[0x24BDD1620];
        v22 = objc_opt_class();
        v35 = 0;
        objc_msgSend(v21, "unarchivedObjectOfClass:fromData:error:", v22, v19, &v35);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v35;
        if (!v23
          || (objc_msgSend(v23, "transferIdentifier"),
              v24 = (void *)objc_claimAutoreleasedReturnValue(),
              v24,
              !v24))
        {
          wc_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v29 = v20;
            NSPrintF();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446722;
            v42 = "-[WCFileStorage enumerateIncomingUserInfosWithBlock:]";
            v43 = 2114;
            v44 = v14;
            v45 = 2114;
            v46 = v30;
            _os_log_error_impl(&dword_216F21000, v25, OS_LOG_TYPE_ERROR, "%{public}s user info malformed %{public}@ due to %{public}@", buf, 0x20u);

          }
          WCDeleteItemAtURL(v16);
LABEL_17:
          v23 = 0;
        }
        buf[0] = 0;
        ((void (**)(id, void *, void *, uint8_t *))v4)[2](v4, v23, v14, buf);
        v27 = buf[0];

        if (v27)
          goto LABEL_21;
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v12);
  }
LABEL_21:

}

- (void)deleteUserInfoTransferFromInbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;

  v4 = a3;
  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WCTransferredUserInfoInboxURLInContainer((uint64_t)v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "transferIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  LOBYTE(v8) = -[WCFileStorage removeItemAtURL:numberOfRetries:error:](self, "removeItemAtURL:numberOfRetries:error:", v9, 5, &v12);
  v10 = v12;
  if ((v8 & 1) == 0)
  {
    wc_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WCFileStorage deleteUserInfoTransferFromInbox:].cold.1(v9);

  }
}

- (void)enumerateUserInfoResultsWithBlock:(id)a3
{
  void (**v4)(id, void *, _QWORD, uint8_t *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WCContentIndex *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
  void (**v35)(id, void *, _QWORD, uint8_t *);
  void *v36;
  id obj;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t v42;
  char v43[15];
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  _QWORD v58[3];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD, uint8_t *))a3;
  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WCUserInfoTransfersInContainer((uint64_t)v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WCFileStorage userInfoResultsIndex](self, "userInfoResultsIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = -[WCContentIndex initWithContainingFolder:]([WCContentIndex alloc], "initWithContainingFolder:", v7);
    -[WCFileStorage setUserInfoResultsIndex:](self, "setUserInfoResultsIndex:", v9);

  }
  -[WCFileStorage userInfoResultsIndex](self, "userInfoResultsIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "index");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v11;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v49;
    v35 = v4;
    v36 = v7;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v39)
        objc_enumerationMutation(obj);
      v13 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v12);
      objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v13, 1, v34);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("userinfo-transfer-result"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = 0;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v15, 2, &v47);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v47;
      if (v16)
      {
        v41 = v13;
        v18 = (void *)MEMORY[0x24BDBCF20];
        v58[0] = objc_opt_class();
        v58[1] = objc_opt_class();
        v58[2] = objc_opt_class();
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setWithArray:", v19);
        v20 = objc_claimAutoreleasedReturnValue();

        v46 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v20, v16, &v46);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v46;
        if (v21)
        {
          v38 = v21;
          objc_msgSend(v15, "URLByDeletingLastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "URLByAppendingPathComponent:isDirectory:", CFSTR("userinfo-transfer-object-data"), 0);
          v23 = objc_claimAutoreleasedReturnValue();

          v45 = 0;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v23, 2, &v45);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v45;
          v17 = v25;
          if (v24)
          {

            v26 = (void *)MEMORY[0x24BDD1620];
            v27 = objc_opt_class();
            v44 = 0;
            objc_msgSend(v26, "unarchivedObjectOfClass:fromData:error:", v27, v24, &v44);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v44;
            if (v28)
            {
              objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("WCUserInfoTransferResultError"));
              v29 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setTransferError:", v29);
            }
            else
            {
              wc_log();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                v53 = "-[WCFileStorage enumerateUserInfoResultsWithBlock:]";
                v54 = 2114;
                v55 = v41;
                _os_log_error_impl(&dword_216F21000, v29, OS_LOG_TYPE_ERROR, "%{public}s didn't unarchive transfer %{public}@", buf, 0x16u);
              }
              v28 = 0;
            }
          }
          else
          {
            objc_msgSend(v15, "URLByDeletingLastPathComponent");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            WCDeleteItemAtURL(v31);
            wc_log();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              -[WCFileStorage enumerateUserInfoResultsWithBlock:].cold.1(&v42, v43, v29);
            v28 = 0;
            v15 = v31;
            v4 = v35;
          }

          v7 = v36;
          v21 = v38;
        }
        else
        {
          wc_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v34 = v17;
            NSPrintF();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446722;
            v53 = "-[WCFileStorage enumerateUserInfoResultsWithBlock:]";
            v54 = 2114;
            v55 = v41;
            v56 = 2114;
            v57 = v33;
            _os_log_error_impl(&dword_216F21000, v23, OS_LOG_TYPE_ERROR, "%{public}s didn't unarchive results %{public}@ due to %{public}@", buf, 0x20u);

            v21 = 0;
          }
          v28 = 0;
        }

        v13 = v41;
      }
      else
      {
        wc_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v17;
          NSPrintF();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446722;
          v53 = "-[WCFileStorage enumerateUserInfoResultsWithBlock:]";
          v54 = 2114;
          v55 = v13;
          v56 = 2114;
          v57 = v30;
          _os_log_impl(&dword_216F21000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s result does not exist, removing from index %{public}@ due to %{public}@", buf, 0x20u);

        }
        v28 = 0;
      }

      buf[0] = 0;
      v4[2](v4, v28, v13, buf);
      v32 = buf[0];

      if (v32)
        break;
      if (v40 == ++v12)
      {
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
        if (v40)
          goto LABEL_5;
        break;
      }
    }
  }

}

- (void)cleanUpWatchContentDirectoryWithCurrentAppInstallationID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WCFileStorage pairingID](self, "pairingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCFileStorage pairingID](self, "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WCWatchDirectoryLocationInContainer((uint64_t)v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, 0, 4, &v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v25;

    if (v11)
    {
      if (objc_msgSend(v11, "code") == -1100 || objc_msgSend(v11, "code") == 260)
        goto LABEL_18;
      wc_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WCFileStorage cleanUpWatchContentDirectoryWithCurrentAppInstallationID:].cold.1();
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v10;
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v13)
      {
        v14 = v13;
        v20 = v10;
        v15 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v17, "lastPathComponent");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v4, "isEqual:", v18);

            if ((v19 & 1) == 0)
              WCDeleteItemAtURL(v17);
          }
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v14);
        v10 = v20;
      }
    }

LABEL_18:
  }

}

- (void)cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[WCFileStorage pairingID](self, "pairingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && v5)
  {
    -[WCFileStorage pairingID](self, "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "containsObject:", v7);

    if (v8)
    {
      -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WCFileStorage pairingID](self, "pairingID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      WCInboxURLInContainer((uint64_t)v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "URLByDeletingLastPathComponent");
      v12 = objc_claimAutoreleasedReturnValue();

      -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WCFileStorage pairingID](self, "pairingID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      WCApplicationSupportURLInContainer((uint64_t)v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "URLByDeletingLastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[WCFileStorage cleanUpOldPairingIDFolderInFolder:pairedDevicesPairingIDs:](self, "cleanUpOldPairingIDFolderInFolder:pairedDevicesPairingIDs:", v12, v4);
      -[WCFileStorage cleanUpOldPairingIDFolderInFolder:pairedDevicesPairingIDs:](self, "cleanUpOldPairingIDFolderInFolder:pairedDevicesPairingIDs:", v16, v4);

      goto LABEL_8;
    }
  }
  else
  {

  }
  wc_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[WCFileStorage cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:].cold.1();
LABEL_8:

}

- (void)cleanUpOldPairingIDFolderInFolder:(id)a3 pairedDevicesPairingIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, 0, 4, &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;

  if (!v9)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v8;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
    if (v11)
    {
      v12 = v11;
      v19 = v8;
      v20 = v5;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v6, "containsObject:", v16) & 1) == 0)
          {
            wc_log();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v15, "path");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446722;
              v27 = "-[WCFileStorage cleanUpOldPairingIDFolderInFolder:pairedDevicesPairingIDs:]";
              v28 = 2114;
              v29 = v6;
              v30 = 2114;
              v31 = v18;
              _os_log_impl(&dword_216F21000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@, deleting %{public}@", buf, 0x20u);

            }
            WCDeleteItemAtURL(v15);
          }

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
      }
      while (v12);
      v8 = v19;
      v5 = v20;
    }
    goto LABEL_18;
  }
  if (objc_msgSend(v9, "code") != -1100 && objc_msgSend(v9, "code") != 260)
  {
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WCFileStorage cleanUpOldPairingIDFolderInFolder:pairedDevicesPairingIDs:].cold.1();
LABEL_18:

  }
}

- (BOOL)removeItemAtURL:(id)a3 numberOfRetries:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  BOOL v11;

  v8 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "removeItemAtURL:error:", v8, a5);

    v11 = (v10 & 1) != 0
       || -[WCFileStorage removeItemAtURL:numberOfRetries:error:](self, "removeItemAtURL:numberOfRetries:error:", v8, a4 - 1, a5);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)appendPathForFileTransfer:(id)a3 toPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "transferIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)outgoingFileTransferPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WCFileTransfersURLInContainer((uint64_t)v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)homeDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appContextFolderURL:(BOOL)a3
{
  if (a3)
    -[WCFileStorage receivedAppContextFolderURL](self, "receivedAppContextFolderURL");
  else
    -[WCFileStorage localAppContextFolderURL](self, "localAppContextFolderURL");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localAppContextFolderURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WCApplicationSupportURLInContainer((uint64_t)v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("ApplicationContext"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)receivedAppContextFolderURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WCFileStorage homeDirectoryURL](self, "homeDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFileStorage pairingID](self, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WCApplicationSupportURLInContainer((uint64_t)v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("ReceivedApplicationContext"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)pairingID
{
  return self->_pairingID;
}

- (OS_dispatch_queue)fileQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)outstandingFileTransfers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutstandingFileTransfers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (WCContentIndex)fileIndex
{
  return (WCContentIndex *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileIndex:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (WCContentIndex)fileResultsIndex
{
  return (WCContentIndex *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileResultsIndex:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (WCContentIndex)userInfoIndex
{
  return (WCContentIndex *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserInfoIndex:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (WCContentIndex)userInfoResultsIndex
{
  return (WCContentIndex *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserInfoResultsIndex:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoResultsIndex, 0);
  objc_storeStrong((id *)&self->_userInfoIndex, 0);
  objc_storeStrong((id *)&self->_fileResultsIndex, 0);
  objc_storeStrong((id *)&self->_fileIndex, 0);
  objc_storeStrong((id *)&self->_outstandingFileTransfers, 0);
  objc_storeStrong((id *)&self->_fileQueue, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
}

void __45__WCFileStorage_loadOutstandingFileTransfers__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[6];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_216F21000, v1, v2, "%{public}s error enumerating files %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_17();
}

- (void)persistOutgoingFileTransfer:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136446722;
  OUTLINED_FUNCTION_23();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_5(&dword_216F21000, v2, (uint64_t)v2, "%{public}s error serializing file transfer %{public}@ due to %{public}@", (uint8_t *)v3);
}

- (void)persistOutgoingFileTransfer:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_0(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s error writing archived data to disk %{public}@, %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)persistOutgoingFileTransfer:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_0(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s error creating outgoing file transfer path %{public}@, %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)deleteOutstandingFileTransfer:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_0(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s failed to remove file transfer %{public}@ error %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)persistOutgoingUserInfoTransfer:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_0(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s error serializing user info transfer %{public}@ due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)persistOutgoingUserInfoTransfer:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_0(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s error writing user info wire data to disk %{public}@, %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)persistOutgoingUserInfoTransfer:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_0(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s error writing archived data to disk %{public}@, %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)persistOutgoingUserInfoTransfer:.cold.4()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_0(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s error creating outgoing user info transfer path %{public}@, %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

void __73__WCFileStorage_loadOutstandingUserInfoTransfersAndComplicationUserInfo___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[6];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_216F21000, v1, v2, "%{public}s error enumerating files %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_17();
}

- (void)deleteOutstandingUserInfoTransfer:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_23();
  _os_log_error_impl(&dword_216F21000, v0, OS_LOG_TYPE_ERROR, "%{public}s failed to remove user info transfer %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)enumerateFileTransferResultsWithBlock:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_13_0(&dword_216F21000, a3, (uint64_t)a3, "result exists without file transfer", a1);
}

- (void)persistAppContextData:received:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8_0();
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s error writing application context data to file (received: %s due to: %{public}@)", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)persistAppContextData:received:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8_0();
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s error creating application context folder (received: %s due to %{public}@)", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)loadAppContextReceived:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8_0();
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s error loading in%s application context data %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)loadAppContextReceived:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8_0();
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s error deserializing%s application context %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)deleteAppContextReceived:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8_0();
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v1, v2, "%{public}s failed to remove%s app context folder %{public}@", v3, v4, v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)loadAppContextDataFromInbox
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[6];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_216F21000, v1, v2, "%{public}s error loading in application context from inbox %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_17();
}

- (void)deleteUserInfoTransferFromInbox:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136446466;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_10(&dword_216F21000, v2, v3, "%{public}s couldn't remove user info at URL %{public}@", (uint8_t *)v4);

  OUTLINED_FUNCTION_9();
}

- (void)enumerateUserInfoResultsWithBlock:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_13_0(&dword_216F21000, a3, (uint64_t)a3, "results exist without file transfer", a1);
}

- (void)createWatchDirectoryIfNeeded:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136446466;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_10(&dword_216F21000, v2, v3, "%{public}s error creating watch directory at %{public}@", (uint8_t *)v4);

  OUTLINED_FUNCTION_9();
}

- (void)createWatchDirectoryIfNeeded:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_13_0(&dword_216F21000, a1, a3, "watch directory exists as file, deleting file", v3);
}

- (void)cleanUpWatchContentDirectoryWithCurrentAppInstallationID:.cold.1()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_28();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v0;
  NSPrintF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v4, v5, "%{public}s error getting contents of %{public}@ due to %{public}@", v6, v7, v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_21();
}

- (void)cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:.cold.1()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  OUTLINED_FUNCTION_28();
  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v2, "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WCCompactStringFromCollection(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136446722;
  v7 = "-[WCFileStorage cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:]";
  v8 = 2114;
  v9 = v3;
  v10 = 2114;
  v11 = v4;
  OUTLINED_FUNCTION_5(&dword_216F21000, v0, v5, "%{public}s missing pairingID: %{public}@, or pairingIDs: %{public}@", (uint8_t *)&v6);

}

- (void)cleanUpOldPairingIDFolderInFolder:pairedDevicesPairingIDs:.cold.1()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_28();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v0;
  NSPrintF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_216F21000, v4, v5, "%{public}s error getting contents of %{public}@ due to %{public}@", v6, v7, v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_21();
}

@end
