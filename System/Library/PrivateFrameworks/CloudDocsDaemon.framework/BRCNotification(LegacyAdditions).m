@implementation BRCNotification(LegacyAdditions)

+ (void)notificationFromItem:()LegacyAdditions relpath:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: item.st.stagedGenerationID == relpath.generationID.fsGenerationID.longValue%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)notificationFromItem:()LegacyAdditions relpath:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: !item.isZoneRoot%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
