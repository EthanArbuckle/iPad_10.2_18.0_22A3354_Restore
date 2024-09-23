@implementation DCCachesDirectory

- (DCCachesDirectory)init
{
  DCCachesDirectory *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSURL *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSURL *cachesDirectoryURL;
  NSURL *v12;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DCCachesDirectory;
  v2 = -[DCCachesDirectory init](&v15, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDBCF48];
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v6, "URLByAppendingPathComponent:", CFSTR("com.apple.DocumentCamera"));
    v7 = (NSURL *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    LOBYTE(v6) = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v14);
    v9 = v14;

    if ((v6 & 1) == 0)
    {
      v10 = os_log_create("com.apple.documentcamera", ");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[DCCachesDirectory init].cold.1((uint64_t)v7, (uint64_t)v9, v10);

    }
    cachesDirectoryURL = v2->_cachesDirectoryURL;
    v2->_cachesDirectoryURL = v7;
    v12 = v7;

  }
  return v2;
}

+ (id)sharedCachesDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__DCCachesDirectory_sharedCachesDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCachesDirectory_onceToken != -1)
    dispatch_once(&sharedCachesDirectory_onceToken, block);
  return (id)sharedCachesDirectory_sharedCachesDirectory;
}

void __42__DCCachesDirectory_sharedCachesDirectory__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCachesDirectory_sharedCachesDirectory;
  sharedCachesDirectory_sharedCachesDirectory = (uint64_t)v1;

}

- (NSURL)cachesDirectoryURL
{
  return self->_cachesDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachesDirectoryURL, 0);
}

- (void)init
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "Failed to create directory %@ with error %@.", (uint8_t *)&v3, 0x16u);
}

@end
