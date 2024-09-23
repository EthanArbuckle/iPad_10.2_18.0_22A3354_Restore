@implementation Application(ApplicationTesting)

+ (void)prepareTestControllerWithType:()ApplicationTesting suiteURL:bundleNames:outputURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11(&dword_1D7CA3000, v0, v1, "Created result bundle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)prepareTestControllerWithType:()ApplicationTesting suiteURL:bundleNames:outputURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_1D7CA3000, v0, v1, "Failed to create/output result bundle: %@ (%@)");
  OUTLINED_FUNCTION_10();
}

+ (void)prepareTestControllerWithType:()ApplicationTesting suiteURL:bundleNames:outputURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_11(&dword_1D7CA3000, v0, v1, "Opened result fifo: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)prepareTestControllerWithType:()ApplicationTesting suiteURL:bundleNames:outputURL:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_1D7CA3000, v0, v1, "Failed to create/output result fifo: %@ (%@)");
  OUTLINED_FUNCTION_10();
}

+ (void)prepareTestControllerWithType:()ApplicationTesting suiteURL:bundleNames:outputURL:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1D7CA3000, v0, v1, "Unknown test type %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)runTest:()ApplicationTesting options:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "The SplitView test has been removed, Safari now uses system windowing", v1, 2u);
}

- (void)_resetHistoryWithCompressedDatabaseAtURL:()ApplicationTesting error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1D7CA3000, v0, v1, "Failed to read %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_resetHistoryWithCompressedDatabaseAtURL:()ApplicationTesting error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1D7CA3000, v0, v1, "Failed to decompress %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

@end
