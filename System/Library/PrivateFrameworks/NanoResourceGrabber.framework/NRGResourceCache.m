@implementation NRGResourceCache

+ (void)setIcon:(id)a3 forIconVariant:(int)a4 inBundleID:(id)a5 withPairedDeviceStorePath:(id)a6
{
  uint64_t v8;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  NSObject *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v8 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a1, "iconCacheDirPathForAppBundleID:withPairedDeviceStorePath:", v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

    if ((v15 & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(a1, "createCachePathIfNecessaryWithPairedDeviceStorePath:", v12);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v24);
      v16 = v24;

      if ((v18 & 1) == 0)
      {
        nrg_daemon_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v26 = v16;
          v27 = 2112;
          v28 = v13;
          _os_log_impl(&dword_211476000, v20, OS_LOG_TYPE_DEFAULT, "setIcon: Error creating cache directory %@ path %@", buf, 0x16u);
        }
        goto LABEL_13;
      }
    }
    v19 = v16;
    objc_msgSend(a1, "cachePathForIconVariant:inBundleID:withPairedDeviceStorePath:", v8, v11, v12);
    v20 = objc_claimAutoreleasedReturnValue();
    v23 = v16;
    v21 = objc_msgSend(v10, "writeToFile:options:error:", v20, 268435457, &v23);
    v16 = v23;

    if ((v21 & 1) == 0)
    {
      nrg_daemon_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_211476000, v22, OS_LOG_TYPE_DEFAULT, "setIcon: Failed writing icon path %@ with error: %@", buf, 0x16u);
      }

    }
LABEL_13:

    goto LABEL_14;
  }
  nrg_daemon_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v26 = (int)v8;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_211476000, v16, OS_LOG_TYPE_DEFAULT, "setIcon: Error creating icon dir path: iconVariant=%ld appBundleID=%@ pairedDeviceStorePath=%@", buf, 0x20u);
  }
LABEL_14:

}

+ (id)iconForIconVariant:(int)a3 inBundleID:(id)a4 withPairedDeviceStorePath:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v6 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "cachePathForIconVariant:inBundleID:withPairedDeviceStorePath:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v10, 0, &v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    if (v12)
    {
      nrg_daemon_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[NRGResourceCache iconForIconVariant:inBundleID:withPairedDeviceStorePath:].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

    }
  }
  else
  {
    nrg_daemon_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v23 = (int)v6;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_211476000, v12, OS_LOG_TYPE_ERROR, "iconForIconVariant: Error creating icon path: iconVariant=%ld appBundleID=%@ pairedDeviceStorePath=%@", buf, 0x20u);
    }
    v11 = 0;
  }

  return v11;
}

+ (void)invalidateBundleID:(id)a3 withPairedDeviceStorePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "cacheDirPathForAppBundleID:withPairedDeviceStorePath:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v12 = objc_msgSend(v11, "removeItemAtPath:error:", v8, &v15);
      v13 = v15;

      if ((v12 & 1) == 0)
      {
        nrg_daemon_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[NRGResourceCache invalidateBundleID:withPairedDeviceStorePath:].cold.2();

      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    nrg_daemon_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[NRGResourceCache invalidateBundleID:withPairedDeviceStorePath:].cold.1();
  }

}

+ (void)invalidatePairedDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v19;

  v4 = a3;
  objc_msgSend(a1, "cacheDirPathForPairedDeviceStorePath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    nrg_daemon_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[NRGResourceCache invalidatePairedDevice:].cold.2((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v5);

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v16 = objc_msgSend(v15, "removeItemAtPath:error:", v5, &v19);
    v17 = v19;

    if ((v16 & 1) == 0)
    {
      nrg_daemon_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[NRGResourceCache invalidatePairedDevice:].cold.1();

    }
  }
  else
  {
    v17 = 0;
  }

}

+ (id)cacheDirPathForPairedDevice
{
  void *v2;
  void *v3;

  NRGGetActivePairedDeviceStorePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.private.nanoresourcegrabber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)cacheDirPathForPairedDeviceStorePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.private.nanoresourcegrabber"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("received"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)cacheDirPathForAppBundleID:(id)a3 withPairedDeviceStorePath:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v6 = a3;
    objc_msgSend(a1, "cacheDirPathForPairedDeviceStorePath:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (void)createCachePathIfNecessaryWithPairedDeviceStorePath:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  char v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "cacheDirPathForPairedDeviceStorePath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v16);
    v8 = v16;

    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v3, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BDBCC68];
      v15 = v8;
      v11 = -[NSObject setResourceValue:forKey:error:](v9, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v10, &v15);
      v12 = v15;

      nrg_daemon_log();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v11 & 1) != 0)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v3;
          _os_log_impl(&dword_211476000, v14, OS_LOG_TYPE_DEFAULT, "createCachePathIfNecessary created and excludedFromBackup %@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        +[NRGResourceCache createCachePathIfNecessaryWithPairedDeviceStorePath:].cold.1();
      }

    }
    else
    {
      nrg_daemon_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[NRGResourceCache createCachePathIfNecessaryWithPairedDeviceStorePath:].cold.2();
      v12 = v8;
    }

  }
}

+ (id)iconCacheDirPathForAppBundleID:(id)a3 withPairedDeviceStorePath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "cacheDirPathForAppBundleID:withPairedDeviceStorePath:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("icons"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)cachePathForIconVariant:(int)a3 inBundleID:(id)a4 withPairedDeviceStorePath:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = *(_QWORD *)&a3;
  objc_msgSend(a1, "iconCacheDirPathForAppBundleID:withPairedDeviceStorePath:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("icon_%d.png"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)iconForIconVariant:(uint64_t)a3 inBundleID:(uint64_t)a4 withPairedDeviceStorePath:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_211476000, a2, a3, "iconForIconVariant: Error reading data %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)invalidateBundleID:withPairedDeviceStorePath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_211476000, v0, v1, "invalidateBundleID: Error creating bundle cache dir path: appBundleID=%@ pairedDeviceStorePath=%@");
  OUTLINED_FUNCTION_2();
}

+ (void)invalidateBundleID:withPairedDeviceStorePath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_211476000, v0, v1, "invalidateBundleID: Failed invalidating cache at %@, error %@");
  OUTLINED_FUNCTION_2();
}

+ (void)invalidatePairedDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_211476000, v0, v1, "invalidatePairedDevice: Failed invalidating paired device cache at %@, error %@");
  OUTLINED_FUNCTION_2();
}

+ (void)invalidatePairedDevice:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_211476000, a2, a3, "invalidatePairedDevice: Error creating bundle cache dir path: pairedDeviceStorePath=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)createCachePathIfNecessaryWithPairedDeviceStorePath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_211476000, v0, v1, "createCachePathIfNecessary: Error setting attributes on cache directory %@ path %@");
  OUTLINED_FUNCTION_2();
}

+ (void)createCachePathIfNecessaryWithPairedDeviceStorePath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_211476000, v0, v1, "createCachePathIfNecessary: Error creating cache directory %@ path %@");
  OUTLINED_FUNCTION_2();
}

@end
