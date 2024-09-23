@implementation FSModuleExtension(Project)

+ (void)moduleExtensionForAppex:()Project .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_23B2A6000, a1, a3, "moduleExtensionForDelegate called", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_19();
}

- (void)sendWipeResource:()Project includingBlockRanges:excludingBlockRanges:replyHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[FSModuleExtension(Project) sendWipeResource:includingBlockRanges:excludingBlockRanges:replyHandler:]";
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_23B2A6000, a2, v4, "%s: %{public}@ no connector talking to fskitd is available", (uint8_t *)&v5);

  OUTLINED_FUNCTION_7();
}

- (void)sendWipeResource:()Project includingBlockRanges:excludingBlockRanges:replyHandler:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendWipeResource:()Project includingBlockRanges:excludingBlockRanges:replyHandler:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:start", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendIsVolumeUsed:()Project bundle:replyHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[FSModuleExtension(Project) sendIsVolumeUsed:bundle:replyHandler:]";
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_23B2A6000, a2, v4, "%s: %{public}@ no connector talking to fskitd is available", (uint8_t *)&v5);

  OUTLINED_FUNCTION_7();
}

- (void)sendIsVolumeUsed:()Project bundle:replyHandler:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendIsVolumeUsed:()Project bundle:replyHandler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10(&dword_23B2A6000, v0, v1, "%s:start:volumeID(%@):bundleID(%@)", v2);
  OUTLINED_FUNCTION_8();
}

- (void)sendConfigureUserClient:()Project replyHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[FSModuleExtension(Project) sendConfigureUserClient:replyHandler:]";
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_23B2A6000, a2, v4, "%s: %{public}@ no connector talking to fskitd is available", (uint8_t *)&v5);

  OUTLINED_FUNCTION_7();
}

- (void)sendConfigureUserClient:()Project replyHandler:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)sendConfigureUserClient:()Project replyHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:start:userClient(%@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

@end
