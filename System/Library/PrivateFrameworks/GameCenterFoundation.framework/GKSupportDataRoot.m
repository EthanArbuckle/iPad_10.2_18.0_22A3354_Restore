@implementation GKSupportDataRoot

void __GKSupportDataRoot_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count"))
  {
    objc_msgSend(v0, "objectAtIndex:", 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("GameKit"));
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C99D20];
    NSHomeDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "arrayWithObjects:", v3, CFSTR("Library"), CFSTR("GameKit"), 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v1);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);
  v7 = v11;

  if ((v6 & 1) == 0)
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __GKSupportDataRoot_block_invoke_cold_1();
  }
  v9 = (void *)GKSupportDataRoot_sSupportRootPath;
  GKSupportDataRoot_sSupportRootPath = (uint64_t)v4;
  v10 = v4;

}

void __GKSupportDataRoot_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_7(&dword_1BCDE3000, v0, v1, "error while trying to create the support root directory at:%@ due to %@");
}

@end
