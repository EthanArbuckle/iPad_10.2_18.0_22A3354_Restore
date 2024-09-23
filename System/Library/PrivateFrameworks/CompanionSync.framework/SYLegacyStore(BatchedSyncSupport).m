@implementation SYLegacyStore(BatchedSyncSupport)

- (void)_postBatchEndMessageWithState:()BatchedSyncSupport error:then:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Ending batched sync due to error, but we're unable to send a sync message due to a bad state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_sendBatchChunk:()BatchedSyncSupport withState:then:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  id v2;
  uint64_t v3;
  uint8_t v4[12];
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_4_1(v2);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_10();
  v5 = 2114;
  v6 = v0;
  OUTLINED_FUNCTION_11(&dword_211704000, v1, v3, "Sending batch chunk (%zu objects), ID %{public}@", v4);

  OUTLINED_FUNCTION_12();
}

- (void)performBatchedSyncToCurrentDBVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Client rejected batch attempt", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)processBatchSyncStart
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "CompanionSync: full batched sync sent to master device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)processBatchSyncEnd:()BatchedSyncSupport .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_4(&dword_211704000, v0, v1, "Ending batched full-sync", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)processBatchChunkAtIndex:()BatchedSyncSupport encodedObjects:error:.cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t v4[12];
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_10();
  v5 = 2048;
  v6 = v2;
  OUTLINED_FUNCTION_11(&dword_211704000, v1, v3, "Batch Sync: adding %zu objects for chunk %zu", v4);

  OUTLINED_FUNCTION_12();
}

- (void)processBatchChunkAck:()BatchedSyncSupport .cold.1(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_23(&dword_211704000, a2, a3, "Received unexpected batch sync chunk ACK: %u", (uint8_t *)v3);
  OUTLINED_FUNCTION_3_1();
}

- (void)processBatchChunkAck:()BatchedSyncSupport .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_211704000, a2, OS_LOG_TYPE_DEBUG, "Received batch chunk ACK: %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3_1();
}

@end
