@implementation BRCPrivateClientZone(LegacyAdditions)

- (void)resolveClashOfAlias:()LegacyAdditions atPath:withAlias:atPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] deleting newest alias at %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)resolveClashOfAlias:()LegacyAdditions atPath:withAlias:atPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] oldest alias still resolves at %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)resolveClashOfAlias:()LegacyAdditions atPath:withAlias:atPath:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] oldest alias doesn't resolve, moving to newest path at %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)resolveClashOfAlias:()LegacyAdditions atPath:withAlias:atPath:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] silently deleting newer item %@%@");
  OUTLINED_FUNCTION_2();
}

@end
