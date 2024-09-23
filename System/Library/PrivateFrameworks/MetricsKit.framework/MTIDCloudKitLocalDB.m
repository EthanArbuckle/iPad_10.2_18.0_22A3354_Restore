@implementation MTIDCloudKitLocalDB

- (MTIDCloudKitLocalDB)initWithContainerIdentifier:(id)a3 recordType:(id)a4 recordZoneID:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTIDCloudKitLocalDB *v11;
  MTIDCloudKitLocalDB *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)MTIDCloudKitLocalDB;
  v11 = -[MTIDCloudKitLocalDB init](&v38, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MTIDCloudKitLocalDB setRecordType:](v11, "setRecordType:", v9);
    -[MTIDCloudKitLocalDB setRecordZoneID:](v12, "setRecordZoneID:", v10);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localDataPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("MetricsIdentifiers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "URLByAppendingPathComponent:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v37 = 0;
      v19 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v37);
      v20 = v37;
      v21 = v20;
      if ((v19 & 1) != 0)
      {
LABEL_7:
        -[MTIDCloudKitLocalDB setPathURL:](v12, "setPathURL:", v18);

        goto LABEL_8;
      }
      v35 = v20;
      v36 = 0;
      objc_msgSend(v18, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v22, &v36);
      v24 = v36;

      if (v23 && v24)
      {
        v21 = v35;
        goto LABEL_7;
      }
      MTMetricsKitOSLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v35;
        _os_log_impl(&dword_20D758000, v29, OS_LOG_TYPE_ERROR, "MetricsKit: Error: %@", buf, 0xCu);
      }

      v30 = (void *)MEMORY[0x24BDBCE88];
      v31 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v18, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("Application doesn't have write access to %@"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "userInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "exceptionWithName:reason:userInfo:", CFSTR("MTIDCloudKitLocalDB"), v33, v34);
      v28 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = (void *)MEMORY[0x24BDBCE88];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MTFrameworkEnvironment.sharedEnvironment.localDataPath is not valid: %@"), v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "exceptionWithName:reason:userInfo:", CFSTR("MTIDCloudKitLocalDB"), v27, 0);
      v28 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_exception_throw(v28);
  }
LABEL_8:

  return v12;
}

- (id)dataForName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v15;

  v6 = a3;
  -[MTIDCloudKitLocalDB pathURL](self, "pathURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v8, 0, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  v11 = v10;
  if (a4 && !v9)
  {
    objc_msgSend(v10, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
    {
      v13 = objc_msgSend(v11, "code");

      if (v13 == 260)
        goto LABEL_8;
    }
    else
    {

    }
    *a4 = objc_retainAutorelease(v11);
  }
LABEL_8:

  return v9;
}

- (BOOL)writeData:(id)a3 forName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[MTIDCloudKitLocalDB pathURL](self, "pathURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v8, "writeToURL:options:error:", v11, 1, a5);
    v9 = (id)v11;
  }
  else
  {
    v12 = -[MTIDCloudKitLocalDB deleteIfExists:error:](self, "deleteIfExists:error:", v9, a5);
  }

  return v12;
}

- (BOOL)fileExists:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[MTIDCloudKitLocalDB pathURL](self, "pathURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  return v9;
}

- (BOOL)deleteIfExists:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v15;

  v6 = a3;
  -[MTIDCloudKitLocalDB pathURL](self, "pathURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v9, "removeItemAtURL:error:", v8, &v15);
  v11 = v15;
  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0B88]))
  {

    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  v13 = objc_msgSend(v11, "code");

  if (v13 == 4)
    v10 = 1;
  if (a4)
  {
LABEL_7:
    if ((v10 & 1) == 0)
      *a4 = objc_retainAutorelease(v11);
  }
LABEL_9:

  return v10;
}

- (id)encodeRecord:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x24BDD1618];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeSystemFieldsWithCoder:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("systemFields"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("namespace"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("namespace"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secretKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("secretKey"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expiration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("expiration"));

  objc_msgSend(v4, "mt_secretValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("secretValue"));
  objc_msgSend(v6, "encodedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)decodeRecordFromData:(id)a3 recordID:(id)a4 isSynchronized:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a5;
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x24BDD1620];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initForReadingFromData:error:", v10, 0);

  objc_msgSend(v11, "setRequiresSecureCoding:", 1);
  objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemFields"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v14 = 0;
    if (v8)
      goto LABEL_5;
LABEL_8:
    v25 = 0;
    goto LABEL_9;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v12, 0);
  objc_msgSend(v13, "setRequiresSecureCoding:", 1);
  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithCoder:", v13);

  if (v14)
  {
    objc_msgSend(v14, "recordType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIDCloudKitLocalDB recordType](self, "recordType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if ((v17 & 1) != 0)
      goto LABEL_6;
  }
  if (!v8)
    goto LABEL_8;
LABEL_5:
  v18 = objc_alloc(MEMORY[0x24BDB91D8]);
  -[MTIDCloudKitLocalDB recordType](self, "recordType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "initWithRecordType:recordID:", v19, v8);

  v5 = 0;
  v14 = (id)v20;
LABEL_6:
  objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namespace"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("namespace"));

  objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secretKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("secretKey"));

  objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiration"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("expiration"));

  objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secretValue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mt_setSecretValue:", v24);

  objc_msgSend(v14, "mt_setSynchronized:", v5);
  v14 = v14;
  v25 = v14;
LABEL_9:

  return v25;
}

- (id)userRecordIDName
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  -[MTIDCloudKitLocalDB dataForName:error:](self, "dataForName:error:", CFSTR("UserRecordID"), &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v3)
  {
    MTMetricsKitOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_20D758000, v4, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to load user record ID with error %@", buf, 0xCu);
    }

  }
  else if (v2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v2, 4);
    goto LABEL_8;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)setUserRecordIDName:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTIDCloudKitLocalDB userRecordIDName](self, "userRecordIDName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4 || (objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    MTMetricsKitOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: CloudKit user has changed", buf, 2u);
    }

    -[MTIDCloudKitLocalDB clearData](self, "clearData");
    if (v4)
      -[MTIDCloudKitLocalDB setNeedsFetchRecords:](self, "setNeedsFetchRecords:", 1);
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = -[MTIDCloudKitLocalDB writeData:forName:error:](self, "writeData:forName:error:", v8, CFSTR("UserRecordID"), &v13);
    v10 = v13;

    if (!v9)
    {
      MTMetricsKitOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_impl(&dword_20D758000, v11, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write user record ID with error %@", buf, 0xCu);
      }

    }
    -[MTIDCloudKitLocalDB setZoneCreated:](self, "setZoneCreated:", 0);

    v6 = 1;
  }

  return v6;
}

- (BOOL)needsFetchRecords
{
  return -[MTIDCloudKitLocalDB fileExists:](self, "fileExists:", CFSTR("NeedsFetch"));
}

- (void)setNeedsFetchRecords:(BOOL)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(CFSTR("1"), "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    -[MTIDCloudKitLocalDB writeData:forName:error:](self, "writeData:forName:error:", v4, CFSTR("NeedsFetch"), &v8);
    v5 = v8;

    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v7 = 0;
    -[MTIDCloudKitLocalDB deleteIfExists:error:](self, "deleteIfExists:error:", CFSTR("NeedsFetch"), &v7);
    v5 = v7;
    if (!v5)
      goto LABEL_8;
  }
  MTMetricsKitOSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_20D758000, v6, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write fetch file with error %@", buf, 0xCu);
  }

LABEL_8:
}

- (id)syncStatusCode
{
  void *v2;
  id v3;
  NSObject *v4;
  __CFString *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  -[MTIDCloudKitLocalDB dataForName:error:](self, "dataForName:error:", CFSTR("SyncEngineStatus"), &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v3)
  {
    MTMetricsKitOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_20D758000, v4, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to load sync engine status with error %@", buf, 0xCu);
    }

    v5 = 0;
  }
  else if (v2)
  {
    v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v2, 4);
  }
  else
  {
    v5 = CFSTR("Starting");
  }

  return v5;
}

- (void)setSyncStatusCode:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = -[MTIDCloudKitLocalDB writeData:forName:error:](self, "writeData:forName:error:", v4, CFSTR("SyncEngineStatus"), &v8);
  v6 = v8;

  if (!v5)
  {
    MTMetricsKitOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write sync engine status with error %@", buf, 0xCu);
    }

  }
}

- (BOOL)writeRecord:(id)a3 error:(id *)a4
{
  id v6;
  MTIDCloudKitLocalDB *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(v6, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mt_syncingFileName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "mt_isSynchronized"))
  {
    MTMetricsKitOSLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "recordID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "recordName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("namespace"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_20D758000, v16, OS_LOG_TYPE_DEBUG, "MetricsKit: Saving unsynchronized record with ID %@ for namespace %@", (uint8_t *)&v25, 0x16u);

    }
    objc_msgSend(v6, "recordID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mt_syncedFileName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[MTIDCloudKitLocalDB deleteIfExists:error:](v7, "deleteIfExists:error:", v21, a4);

    if (v22)
      goto LABEL_9;
LABEL_11:
    LOBYTE(a4) = 0;
    goto LABEL_12;
  }
  MTMetricsKitOSLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("namespace"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v12;
    v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_20D758000, v10, OS_LOG_TYPE_DEBUG, "MetricsKit: Saving synchronized record with ID %@ for namespace %@", (uint8_t *)&v25, 0x16u);

  }
  if (!-[MTIDCloudKitLocalDB deleteIfExists:error:](v7, "deleteIfExists:error:", v9, a4))
    goto LABEL_11;
  objc_msgSend(v6, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mt_syncedFileName");
  v15 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v15;
LABEL_9:
  -[MTIDCloudKitLocalDB encodeRecord:](v7, "encodeRecord:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = -[MTIDCloudKitLocalDB writeData:forName:error:](v7, "writeData:forName:error:", v23, v9, a4);

  if ((_DWORD)a4)
  {
    -[MTIDCloudKitLocalDB delegate](v7, "delegate");
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a4, "cloudKitLocalDB:didChangeRecord:", v7, v6);

    LOBYTE(a4) = 1;
  }
LABEL_12:

  objc_sync_exit(v7);
  return (char)a4;
}

- (id)recordWithID:(id)a3 error:(id *)a4
{
  id v6;
  MTIDCloudKitLocalDB *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(v6, "mt_syncedFileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MTIDCloudKitLocalDB fileExists:](v7, "fileExists:", v8);
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v6, "mt_syncingFileName");
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  -[MTIDCloudKitLocalDB dataForName:error:](v7, "dataForName:error:", v8, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[MTIDCloudKitLocalDB decodeRecordFromData:recordID:isSynchronized:](v7, "decodeRecordFromData:recordID:isSynchronized:", v11, v6, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v17 = 0;
      v13 = -[MTIDCloudKitLocalDB deleteIfExists:error:](v7, "deleteIfExists:error:", v8, &v17);
      v14 = v17;
      if (!v13)
      {
        MTMetricsKitOSLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v8;
          v20 = 2112;
          v21 = v14;
          _os_log_impl(&dword_20D758000, v15, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to delete corrupted data file %@ error %@", buf, 0x16u);
        }

      }
    }
  }
  else
  {
    v12 = 0;
  }

  objc_sync_exit(v7);
  return v12;
}

- (BOOL)deleteRecordWithID:(id)a3 error:(id *)a4
{
  id v6;
  MTIDCloudKitLocalDB *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(v6, "mt_syncingFileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MTIDCloudKitLocalDB deleteIfExists:error:](v7, "deleteIfExists:error:", v8, a4))
  {
    objc_msgSend(v6, "mt_syncedFileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MTIDCloudKitLocalDB deleteIfExists:error:](v7, "deleteIfExists:error:", v9, a4);

  }
  else
  {
    v10 = 0;
  }

  objc_sync_exit(v7);
  return v10;
}

- (id)pendingRecordIDs
{
  MTIDCloudKitLocalDB *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB91E8], "mt_syncingFileExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCloudKitLocalDB pathURL](v2, "pathURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
LABEL_2:

  v10 = v9;
  while (1)
  {
    objc_msgSend(v8, "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    v10 = v9;
    if (objc_msgSend(v9, "hasSuffix:", v5))
    {
      objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - objc_msgSend(v5, "length"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x24BDB91E8]);
      -[MTIDCloudKitLocalDB recordZoneID](v2, "recordZoneID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "initWithRecordName:zoneID:", v6, v7);
      objc_msgSend(v4, "addObject:", v12);

      goto LABEL_2;
    }
  }

  objc_sync_exit(v2);
  return v4;
}

- (void)clearData
{
  NSObject *v3;
  MTIDCloudKitLocalDB *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  char v11;
  id v12;
  char v13;
  NSObject *v14;
  __int128 v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  MTMetricsKitOSLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D758000, v3, OS_LOG_TYPE_DEBUG, "MetricsKit: Clearing local CloudKit record cache", buf, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCloudKitLocalDB pathURL](v4, "pathURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, 0, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  *(_QWORD *)&v9 = 138412546;
  v15 = v9;
  while (1)
  {
    objc_msgSend(v7, "nextObject", v15);
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
      break;
    v16 = 0;
    v11 = objc_msgSend(v5, "removeItemAtURL:error:", v10, &v16);
    v12 = v16;
    if (v12)
      v13 = v11;
    else
      v13 = 1;
    if ((v13 & 1) == 0)
    {
      MTMetricsKitOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v15;
        v18 = v10;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_20D758000, v14, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to remove local record data %@ with error %@", buf, 0x16u);
      }

    }
    v8 = (void *)v10;
  }

  objc_sync_exit(v4);
}

- (id)allRecords
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTIDCloudKitLocalDB pathURL](self, "pathURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v8, 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDB91E8], "mt_syncedFileExtension");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTIDCloudKitLocalDB decodeRecordFromData:recordID:isSynchronized:](self, "decodeRecordFromData:recordID:isSynchronized:", v9, 0, objc_msgSend(v10, "hasSuffix:", v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v6, "addObject:", v12);

      }
      objc_msgSend(v5, "nextObject");
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v13;
    }
    while (v13);
  }

  return v6;
}

- (MTIDCloudKitLocalDBDelegate)delegate
{
  return (MTIDCloudKitLocalDBDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
  objc_storeStrong((id *)&self->_recordType, a3);
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneID, a3);
}

- (NSURL)pathURL
{
  return self->_pathURL;
}

- (void)setPathURL:(id)a3
{
  objc_storeStrong((id *)&self->_pathURL, a3);
}

- (BOOL)zoneCreated
{
  return self->_zoneCreated;
}

- (void)setZoneCreated:(BOOL)a3
{
  self->_zoneCreated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathURL, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
