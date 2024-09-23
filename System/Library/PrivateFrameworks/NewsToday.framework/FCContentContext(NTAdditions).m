@implementation FCContentContext(NTAdditions)

+ (id)nt_contentContextWithConfigurationManager:()NTAdditions contentHostDirectory:networkBehaviorMonitor:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[FCContentContext(NTAdditions) nt_contentContextWithConfigurationManager:contentHostDirectory:networkBehaviorMonitor:].cold.2();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[FCContentContext(NTAdditions) nt_contentContextWithConfigurationManager:contentHostDirectory:networkBehaviorMonitor:].cold.1();
LABEL_6:
  objc_msgSend(MEMORY[0x24BE6CB30], "defaultConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BE6CB28]);
  objc_msgSend(MEMORY[0x24BE6CC58], "sharedNetworkReachability");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:networkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:", v10, v7, v8, v9, v12, 0x101FC383FLL, 10, 0, 0, 0, 0);

  return v13;
}

+ (void)nt_contentContextWithConfigurationManager:()NTAdditions contentHostDirectory:networkBehaviorMonitor:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentHostDirectoryFileURL", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)nt_contentContextWithConfigurationManager:()NTAdditions contentHostDirectory:networkBehaviorMonitor:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"configurationManager", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
