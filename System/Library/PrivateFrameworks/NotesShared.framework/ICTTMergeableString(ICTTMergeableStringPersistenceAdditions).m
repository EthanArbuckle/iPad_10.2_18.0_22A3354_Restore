@implementation ICTTMergeableString(ICTTMergeableStringPersistenceAdditions)

- (void)initWithData:()ICTTMergeableStringPersistenceAdditions replicaID:fragment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "ICTTMergeableString protobuf corrupt.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Corrupt mergeable string, bad string data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Corrupt mergeable string, zeroed UUID timestamp.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Corrupt mergeable string, uuid index > number of uuids - loading empty string.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Corrupt mergeable string, child substring index > number of substrings.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Corrupt mergeable string, substring max > string max. Starting a new string from available data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Corrupt mergeable string, substring missing component.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
