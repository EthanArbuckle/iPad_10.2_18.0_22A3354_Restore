@implementation MSDKCacheManager

+ (id)getDeviceFileCachePath:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;

  v3 = a3;
  if (!v3)
  {
    defaultLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getDeviceFileCachePath:].cold.1(v5, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      defaultLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[MSDKCacheManager getDeviceFileCachePath:].cold.4(v5);
      goto LABEL_9;
    }
  }
  objc_msgSend(v3, "fileHash");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    defaultLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getDeviceFileCachePath:].cold.2();
    goto LABEL_9;
  }
  v5 = v4;
  -[NSObject hexStringRepresentation](v4, "hexStringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    defaultLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getDeviceFileCachePath:].cold.3();

LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/MSDWorkContainer/.MSD_cache"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v8;
}

+ (id)getDeviceManifestCachePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getDeviceManifestCachePath:].cold.1(v7, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_9;
  }
  objc_msgSend(v3, "filePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getDeviceManifestCachePath:].cold.2();
LABEL_9:
    v8 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v4, "filePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/MSDWorkContainer/.MSD_cache_manifest"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  return v8;
}

+ (id)getDeviceContentPlistCachePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getDeviceContentPlistCachePath:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_12;
  }
  objc_msgSend(v3, "partNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getDeviceContentPlistCachePath:].cold.2(v12, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_12;
  }
  objc_msgSend(v4, "revision");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getDeviceContentPlistCachePath:].cold.3(v12, v27, v28, v29, v30, v31, v32, v33);
LABEL_12:

    v10 = 0;
    goto LABEL_5;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "partNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revision");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@_%d.plist"), CFSTR("/var/MSDWorkContainer/.MSD_cache_content_plist"), v8, objc_msgSend(v9, "intValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v10;
}

+ (id)getBundleFilePathFromHash:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getBundleFilePathFromHash:].cold.1(v6, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_13;
  }
  objc_msgSend(v3, "hexStringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getBundleFilePathFromHash:].cold.2(v6, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_13;
  }
  if ((unint64_t)-[NSObject length](v6, "length") <= 1)
  {
    defaultLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[MSDKCacheManager getBundleFilePathFromHash:].cold.3();

LABEL_13:
    v9 = 0;
    goto LABEL_5;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[NSObject substringToIndex:](v6, "substringToIndex:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v9;
}

+ (void)getDeviceFileCachePath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Item is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getDeviceFileCachePath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Item %{public}@ has empty hash, cannot build device cache path", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getDeviceFileCachePath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Failed to generate hash string for item %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getDeviceFileCachePath:(NSObject *)a1 .cold.4(NSObject *a1)
{
  void *v2;
  id v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_class();
  v3 = v2;
  v5 = 136315650;
  v6 = "+[MSDKCacheManager getDeviceFileCachePath:]";
  v7 = 2114;
  v8 = v2;
  v9 = 2114;
  v10 = (id)objc_opt_class();
  v4 = v10;
  _os_log_error_impl(&dword_213A7E000, a1, OS_LOG_TYPE_ERROR, "%s: Item is not of type %{public}@ or %{public}@", (uint8_t *)&v5, 0x20u);

}

+ (void)getDeviceManifestCachePath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Manifest is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getDeviceManifestCachePath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Manifest %{public}@ has empty filePath, cannot build manifest cache path", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getDeviceContentPlistCachePath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Manifest is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getDeviceContentPlistCachePath:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Manifest part number is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getDeviceContentPlistCachePath:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Manifest revision is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getBundleFilePathFromHash:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Hash is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getBundleFilePathFromHash:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Failed to generate hash string", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getBundleFilePathFromHash:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s: Hash string %{public}@ too short", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
