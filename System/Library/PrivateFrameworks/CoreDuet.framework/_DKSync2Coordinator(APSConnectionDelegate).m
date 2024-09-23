@implementation _DKSync2Coordinator(APSConnectionDelegate)

- (void)connection:()APSConnectionDelegate didReceivePublicToken:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Did receive public token: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

- (void)connection:()APSConnectionDelegate didReceiveIncomingMessage:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_19_0(), "topic");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v2, v3, "%{public}@: Did receive message for topic: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

@end
