@implementation MOEventBundleProcessor(LearnFromThisApp)

+ (void)approvedForLearnFromThisApp:()LearnFromThisApp .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "approvedForLearnFromThisApp, nothing is blocked with deny list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)_learningFromAppDenyList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "approvedForLearnFromThisApp,failed to read deny list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)readLearnedFromTheAppStatusTable
{
  OUTLINED_FUNCTION_3_1(&dword_1CAE42000, a2, a3, "Could not read to the LFTA plist file, error: %@", a5, a6, a7, a8, 2u);
}

+ (void)persistLearnedFromTheAppStatusTable:()LearnFromThisApp .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "invalid path for LFTA status plist file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)persistLearnedFromTheAppStatusTable:()LearnFromThisApp .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1CAE42000, v0, v1, "Failed to get cache directory to store LFTA plist file, nil cache directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)persistLearnedFromTheAppStatusTable:()LearnFromThisApp .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1CAE42000, a2, a3, "couldn't write to the LFTA status plist file, %@", a5, a6, a7, a8, 2u);
}

@end
