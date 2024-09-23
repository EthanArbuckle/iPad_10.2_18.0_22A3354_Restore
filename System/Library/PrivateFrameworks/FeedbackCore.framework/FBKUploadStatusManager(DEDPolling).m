@implementation FBKUploadStatusManager(DEDPolling)

- (void)pollDEDForSessionsStateOnActiveSession:()DEDPolling uploadTask:isCurrentDeviceSession:totalQueryCount:lastState:lastInfo:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "taskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134217984;
  v5 = objc_msgSend(v3, "longValue");
  _os_log_debug_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_DEBUG, "Task [%lu] is no longer tracked. Will not poll", (uint8_t *)&v4, 0xCu);

}

@end
