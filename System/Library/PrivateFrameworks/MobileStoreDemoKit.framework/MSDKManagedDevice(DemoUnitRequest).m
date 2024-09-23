@implementation MSDKManagedDevice(DemoUnitRequest)

- (void)checkInWithCompletion:()DemoUnitRequest .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)checkInWithCompletion:()DemoUnitRequest .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Device not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)markAsNotDemoWithCompletion:()DemoUnitRequest .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)markAsNotDemoWithCompletion:()DemoUnitRequest .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Device not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)searchStoreWithOptions:()DemoUnitRequest completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)searchStoreWithOptions:()DemoUnitRequest completion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Device not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleCheckInXPCResponse:()DemoUnitRequest withCompletion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - xpc response for CheckIn is of unexpected type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleSearchXPCResponse:()DemoUnitRequest withCompletion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Store Search invalid response in xpc", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleSearchXPCResponse:()DemoUnitRequest withCompletion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to get store search result from xpc dictionary", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleSearchXPCResponse:()DemoUnitRequest withCompletion:.cold.3(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 136315394;
  v5 = "-[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:]";
  v6 = 2114;
  v7 = (id)objc_opt_class();
  v3 = v7;
  _os_log_error_impl(&dword_213A7E000, a2, OS_LOG_TYPE_ERROR, "%s - Store Search result format not correct: %{public}@", (uint8_t *)&v4, 0x16u);

}

- (void)_handleSearchXPCResponse:()DemoUnitRequest withCompletion:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Store Search Failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleSearchXPCResponse:()DemoUnitRequest withCompletion:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - xpc response for Store Search is of unexpected type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
