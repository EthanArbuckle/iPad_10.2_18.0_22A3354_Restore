@implementation ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions)

- (void)initWithArchive:()TTAttributedStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1BD918000, v0, OS_LOG_TYPE_FAULT, "ICTTMergeableAttributedString attribute length is not equal to string length. Continuing with available data.", v1, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithArchive:()TTAttributedStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "ICTTMergeableAttributedString cannot load attributes.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)attributesForRun:()TTAttributedStringPersistenceAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "ICTTMergeableAttributedString cannot load attachment without identifier/info.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)saveAttributes:()TTAttributedStringPersistenceAdditions toArchive:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Saving attachment without identifier!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
