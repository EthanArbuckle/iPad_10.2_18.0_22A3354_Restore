@implementation APVersionData

- (APVersionData)init
{
  const char *v2;
  uint64_t v3;
  APVersionData *v4;
  uint64_t v5;
  NSFileManager *fileManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APVersionData;
  v4 = -[APVersionData init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    fileManager = v4->_fileManager;
    v4->_fileManager = (NSFileManager *)v5;

  }
  return v4;
}

- (id)subdirectoriesAtURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_fileManager(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v7, v8, (uint64_t)v4, 0, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_allObjects(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    APLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 138477827;
      v17 = (id)objc_opt_class();
      v14 = v17;
      _os_log_impl(&dword_235C39000, v13, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Unable to create Enumerator from URL.", (uint8_t *)&v16, 0xCu);

    }
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
