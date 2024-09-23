@implementation NSURL(ExtensionKitAdditions)

- (uint64_t)_EX_isDirectory
{
  void *v1;
  uint64_t v2;
  int v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v9;
  id v10;

  objc_msgSend(a1, "URLByResolvingSymlinksInPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v2 = *MEMORY[0x1E0C999D0];
  v9 = 0;
  v3 = objc_msgSend(v1, "getResourceValue:forKey:error:", &v10, v2, &v9);
  v4 = v10;
  v5 = v9;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    _EXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[NSURL(ExtensionKitAdditions) _EX_isDirectory].cold.1();

    v6 = 0;
  }

  return v6;
}

- (uint64_t)_EX_isApplication
{
  uint64_t v1;
  int v2;
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v8;
  id v9;

  v9 = 0;
  v1 = *MEMORY[0x1E0C999C0];
  v8 = 0;
  v2 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v9, v1, &v8);
  v3 = v9;
  v4 = v8;
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    _EXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[NSURL(ExtensionKitAdditions) _EX_isApplication].cold.1();

    v5 = 0;
  }

  return v5;
}

- (id)_EX_containingApplicationBundleURL
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "absoluteURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByDeletingLastPathComponent");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x194018140]();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "length");

  if (v5)
  {
    while (!objc_msgSend(v2, "_EX_isApplication"))
    {
      objc_msgSend(v2, "URLByDeletingLastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v7, "length");

      v2 = v6;
      if (!v5)
      {
        v2 = v6;
        goto LABEL_6;
      }
    }
    v2 = v2;
    v5 = v2;
  }
LABEL_6:
  objc_autoreleasePoolPop(v3);

  return v5;
}

- (uint64_t)_EX_isContainedInDirectory:()ExtensionKitAdditions
{
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v9;

  v9 = 2;
  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v9, v5, a1, 0);

  if (v9)
    return 0;
  else
    return v7;
}

- (void)_EX_isDirectory
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_190C25000, v0, v1, "Failed to get NSURLIsDirectoryKey property for URL '%@' with error '%{public}@'");
}

- (void)_EX_isApplication
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_190C25000, v0, v1, "Failed to get NSURLIsApplicationKey property for URL '%@' with error '%{public}@'");
}

@end
