@implementation SYLegacyStore(FullSyncSupport)

- (void)_retrySync
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_211704000, v0, v1, "Full-sync failed, maximum retry attempts reached.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
