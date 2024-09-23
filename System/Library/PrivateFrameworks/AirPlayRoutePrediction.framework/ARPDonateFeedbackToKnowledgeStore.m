@implementation ARPDonateFeedbackToKnowledgeStore

uint64_t __ARPDonateFeedbackToKnowledgeStore_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __ARPDonateFeedbackToKnowledgeStore_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  v5 = *(id *)(a1 + 32);
  if (v4)
  {
    ARPFeedbackLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __ARPDonateFeedbackToKnowledgeStore_block_invoke_2_cold_1();

  }
}

void __ARPDonateFeedbackToKnowledgeStore_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1DD793000, v0, v1, "Error donating airplay prediction feedback: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
