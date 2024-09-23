@implementation SSUCacheDirectoryProviderTemporary

- (id)lookupOrCreateCacheDirectory:(id *)a3
{
  NSURL *directory;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSURL *v10;
  NSURL *v11;
  void *v12;
  NSURL *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  directory = self->__directory;
  if (!directory)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SSUCacheDirectoryProviderTemporary-%p"), self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v9);
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v11 = self->__directory;
    self->__directory = v10;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->__directory;
    v23 = 0;
    v14 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v23);
    v15 = v23;

    if (a3)
    {
      if ((v14 & 1) == 0)
      {
        v16 = *MEMORY[0x24BDD0FC8];
        v25[0] = CFSTR("Could not create cache directory.");
        v17 = *MEMORY[0x24BDD0FD8];
        v24[0] = v16;
        v24[1] = v17;
        v18 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v15, "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("createDirectoryAtURL call failed with error: %@."), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SSUCacheDirectoryProviderErrorDomain"), 2, v21);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    if (!v14)
      return 0;
    directory = self->__directory;
  }
  return directory;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  NSURL *v5;
  char v6;
  id v7;
  NSObject *v8;
  NSURL *directory;
  NSURL *v10;
  objc_super v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  NSURL *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->__directory)
  {
    CDMOSLoggerForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      directory = self->__directory;
      *(_DWORD *)buf = 136315394;
      v14 = "-[SSUCacheDirectoryProviderTemporary dealloc]";
      v15 = 2112;
      v16 = directory;
      _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Cleaning up temporary cache directory: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->__directory;
    v12 = 0;
    v6 = objc_msgSend(v4, "removeItemAtURL:error:", v5, &v12);
    v7 = v12;

    if ((v6 & 1) == 0)
    {
      CDMOSLoggerForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = self->__directory;
        *(_DWORD *)buf = 136315650;
        v14 = "-[SSUCacheDirectoryProviderTemporary dealloc]";
        v15 = 2112;
        v16 = v10;
        v17 = 2112;
        v18 = v7;
        _os_log_error_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to remove temporary cache directory: %@. Error: %@.", buf, 0x20u);
      }

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SSUCacheDirectoryProviderTemporary;
  -[SSUCacheDirectoryProviderTemporary dealloc](&v11, sel_dealloc);
}

- (NSURL)_directory
{
  return self->__directory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__directory, 0);
}

@end
