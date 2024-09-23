@implementation RBSProcessIdentity(FBProcess)

- (id)fb_processClass
{
  char v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v7;

  v7 = 0;
  v2 = objc_msgSend(a1, "treatedAsAnAppByFrontBoard:", &v7);
  v3 = v7;
  if (v3)
  {
    FBLogProcess();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[RBSProcessIdentity(FBProcess) fb_processClass].cold.1();

  }
  if ((v2 & 1) == 0)
    objc_msgSend(a1, "isXPCService");
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)fb_processClass
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_15(&dword_1A359A000, v1, (uint64_t)v1, "treatedAsAnAppByFrontBoard for %@ returned error %@", v2);
  OUTLINED_FUNCTION_12();
}

@end
