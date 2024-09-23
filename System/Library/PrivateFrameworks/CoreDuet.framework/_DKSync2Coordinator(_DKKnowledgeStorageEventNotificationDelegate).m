@implementation _DKSync2Coordinator(_DKKnowledgeStorageEventNotificationDelegate)

- (void)_databaseDidDeleteFromStreamNameCounts:()_DKKnowledgeStorageEventNotificationDelegate .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v5;
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_29(&dword_18DDBE000, a3, v8, "%{public}@: Delete from %@ event streams is not triggering sync attemt due to event count of %@", (uint8_t *)&v9);

}

- (void)_databaseDidDeleteFromStreamNameCounts:()_DKKnowledgeStorageEventNotificationDelegate .cold.2()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v3, v4, "%{public}@: Deletion of %@ events is not triggering sync attempt because isSingleDevice=YES", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)knowledgeStorage:()_DKKnowledgeStorageEventNotificationDelegate didDeleteEventsWithStreamNameCounts:.cold.1()
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
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "%{public}@: Delete with stream names: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

@end
