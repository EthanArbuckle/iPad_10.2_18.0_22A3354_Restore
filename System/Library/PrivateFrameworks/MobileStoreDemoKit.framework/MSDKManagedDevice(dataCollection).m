@implementation MSDKManagedDevice(dataCollection)

- (void)getCurrentAppUsageSessionUUID
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Failed to get current app usage session UUID.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)collectAppUsageWithSessionStart:()dataCollection andEnd:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
