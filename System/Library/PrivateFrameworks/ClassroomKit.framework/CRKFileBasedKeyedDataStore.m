@implementation CRKFileBasedKeyedDataStore

- (CRKFileBasedKeyedDataStore)init
{
  void *v3;
  CRKFileBasedKeyedDataStore *v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "crk_uniqueTemporaryDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRKFileBasedKeyedDataStore initWithDirectoryURL:](self, "initWithDirectoryURL:", v3);

  return v4;
}

- (CRKFileBasedKeyedDataStore)initWithDirectoryURL:(id)a3
{
  return -[CRKFileBasedKeyedDataStore initWithDirectoryURL:directoryResourceValuesByKey:](self, "initWithDirectoryURL:directoryResourceValuesByKey:", a3, MEMORY[0x24BDBD1B8]);
}

+ (id)excludedFromiCloudBackupStoreWithDirectoryURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v9 = *MEMORY[0x24BDBCC68];
  v10[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDirectoryURL:directoryResourceValuesByKey:", v4, v6);

  return v7;
}

- (CRKFileBasedKeyedDataStore)initWithDirectoryURL:(id)a3 directoryResourceValuesByKey:(id)a4
{
  id v8;
  id v9;
  CRKFileBasedKeyedDataStore *v10;
  CRKFileBasedKeyedDataStore *v11;
  uint64_t v12;
  NSFileManager *fileManager;
  uint64_t v14;
  NSDictionary *directoryResourceValuesByKey;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKFileBasedKeyedDataStore.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryURL"));

  }
  v18.receiver = self;
  v18.super_class = (Class)CRKFileBasedKeyedDataStore;
  v10 = -[CRKFileBasedKeyedDataStore init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_directoryURL, a3);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = objc_claimAutoreleasedReturnValue();
    fileManager = v11->_fileManager;
    v11->_fileManager = (NSFileManager *)v12;

    v14 = objc_msgSend(v9, "copy");
    directoryResourceValuesByKey = v11->_directoryResourceValuesByKey;
    v11->_directoryResourceValuesByKey = (NSDictionary *)v14;

    -[CRKFileBasedKeyedDataStore updateExistingDirectoryResourceValues](v11, "updateExistingDirectoryResourceValues");
  }

  return v11;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v15 = -[CRKFileBasedKeyedDataStore removeDataForKey:error:](self, "removeDataForKey:error:", v9, a5);
    goto LABEL_9;
  }
  -[CRKFileBasedKeyedDataStore fileManager](self, "fileManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKFileBasedKeyedDataStore directoryURL](self, "directoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "fileExistsAtPath:", v12);

  if ((v13 & 1) == 0)
  {
    -[CRKFileBasedKeyedDataStore fileManager](self, "fileManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFileBasedKeyedDataStore directoryURL](self, "directoryURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 1, 0, a5);

    if (!v18)
      goto LABEL_8;
    -[CRKFileBasedKeyedDataStore directoryResourceValuesByKey](self, "directoryResourceValuesByKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "count"))
    {

      goto LABEL_3;
    }
    -[CRKFileBasedKeyedDataStore directoryURL](self, "directoryURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFileBasedKeyedDataStore directoryResourceValuesByKey](self, "directoryResourceValuesByKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "setResourceValues:error:", v21, a5);

    if (!v22)
    {
LABEL_8:
      v15 = 0;
      goto LABEL_9;
    }
  }
LABEL_3:
  -[CRKFileBasedKeyedDataStore URLForKey:](self, "URLForKey:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "writeToURL:options:error:", v14, 1, a5);

LABEL_9:
  return v15;
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v14;

  v6 = a3;
  if (-[CRKFileBasedKeyedDataStore isKeyValid:](self, "isKeyValid:", v6))
  {
    v7 = (void *)MEMORY[0x24BDBCE50];
    -[CRKFileBasedKeyedDataStore URLForKey:](self, "URLForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v7, "dataWithContentsOfURL:options:error:", v8, 0, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (!v9)
    {
      objc_msgSend(v10, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
      {
        v12 = objc_msgSend(v10, "code");

        if (v12 == 260)
        {

          v10 = 0;
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {

      }
    }
    if (a4 && v10)
    {
      v10 = objc_retainAutorelease(v10);
      *a4 = v10;
    }
    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)removeDataForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  if (-[CRKFileBasedKeyedDataStore isKeyValid:](self, "isKeyValid:", v6))
  {
    -[CRKFileBasedKeyedDataStore fileManager](self, "fileManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFileBasedKeyedDataStore URLForKey:](self, "URLForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "crk_safeRemoveItemAtURL:error:", v8, a4);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)removeAllDataWithError:(id *)a3
{
  void *v5;
  void *v6;

  -[CRKFileBasedKeyedDataStore fileManager](self, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKFileBasedKeyedDataStore directoryURL](self, "directoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "crk_safeRemoveItemAtURL:error:", v6, a3);

  return (char)a3;
}

- (void)updateExistingDirectoryResourceValues
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "directoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "verboseDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_218C99000, v5, OS_LOG_TYPE_ERROR, "Failed to set resource values for directory %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);

}

- (BOOL)isKeyValid:(id)a3
{
  return objc_msgSend(a3, "length") != 0;
}

- (id)URLForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!-[CRKFileBasedKeyedDataStore isKeyValid:](self, "isKeyValid:", v5))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKFileBasedKeyedDataStore.m"), 126, CFSTR("key \"%@\" is invalid"), v5);

  }
  -[CRKFileBasedKeyedDataStore directoryURL](self, "directoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_directoryURL, a3);
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (NSDictionary)directoryResourceValuesByKey
{
  return self->_directoryResourceValuesByKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryResourceValuesByKey, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
