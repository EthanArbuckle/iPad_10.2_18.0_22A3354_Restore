@implementation _DKEvent(INRelevantShortcut)

+ (void)eventWithRelevantShortcut:()INRelevantShortcut bundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v0, v1, "Error archiving relevant shortcut: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)relevantShortcut
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "stream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v5, "Failure to convert event of stream %@ to a relevant shortcut", v6);

}

@end
