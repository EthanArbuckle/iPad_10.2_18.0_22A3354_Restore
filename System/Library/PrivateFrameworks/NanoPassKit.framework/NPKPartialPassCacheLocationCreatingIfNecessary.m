@implementation NPKPartialPassCacheLocationCreatingIfNecessary

void ___NPKPartialPassCacheLocationCreatingIfNecessary_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF48];
  PKCacheDirectoryPath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("PartialPassCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Removing old partial pass download cache at %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v9 = objc_msgSend(v8, "removeItemAtURL:error:", v3, &v11);
    v10 = v11;

    if ((v9 & 1) == 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v3;
        v14 = 2112;
        v15 = v10;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Could not remove old partial pass download cache at %@: %@", buf, 0x16u);
      }

    }
  }

}

@end
