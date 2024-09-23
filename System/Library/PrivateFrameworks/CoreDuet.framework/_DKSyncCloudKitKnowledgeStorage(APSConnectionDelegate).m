@implementation _DKSyncCloudKitKnowledgeStorage(APSConnectionDelegate)

- (void)connection:()APSConnectionDelegate didReceiveIncomingMessage:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Fetching source device identifiers after receiving a push notification as a single device", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)connection:()APSConnectionDelegate didReceiveIncomingMessage:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_18DDBE000, v1, v2, "%{public}@: Set database changes exist bit", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
