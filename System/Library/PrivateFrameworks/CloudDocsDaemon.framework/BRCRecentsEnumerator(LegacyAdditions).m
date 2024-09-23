@implementation BRCRecentsEnumerator(LegacyAdditions)

- (void)dropItemWithFileObjectID:()LegacyAdditions notifRank:itemIsLive:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] dropping item from recents index %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)dropItemWithFileObjectID:()LegacyAdditions notifRank:itemIsLive:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] not dropping item, it is still live: %@%@");
  OUTLINED_FUNCTION_2();
}

@end
