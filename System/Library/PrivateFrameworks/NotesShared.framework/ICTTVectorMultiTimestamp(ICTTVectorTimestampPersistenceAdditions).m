@implementation ICTTVectorMultiTimestamp(ICTTVectorTimestampPersistenceAdditions)

- (void)initWithData:()ICTTVectorTimestampPersistenceAdditions andCapacity:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "ICTTVectorMultiTimestamp protobuf corrupt.", a5, a6, a7, a8, 0);
}

- (void)initWithArchive:()ICTTVectorTimestampPersistenceAdditions andCapacity:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "ICTTVectorMultiTimestamp clock requires uuids.", a5, a6, a7, a8, 0);
}

- (void)initWithArchive:()ICTTVectorTimestampPersistenceAdditions andCapacity:.cold.2(int a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "ICTTVectorMultiTimestamp requires the same number of clocks as capacity %d != %ld.", (uint8_t *)v3, 0x12u);
}

@end
