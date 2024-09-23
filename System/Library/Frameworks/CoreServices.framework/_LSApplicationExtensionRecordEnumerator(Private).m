@implementation _LSApplicationExtensionRecordEnumerator(Private)

- (void)_evaluatePluginNoIO:()Private data:extensionPointID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Skipping plugin %llx during enumeration because it was filtered out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_evaluatePluginNoIO:()Private data:extensionPointID:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Skipping plugin %llx during enumeration because it is hidden by app protection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_evaluatePluginNoIO:()Private data:extensionPointID:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Not skipping plugin %llx during enumeration because ep allows hidden plugins", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_evaluatePluginNoIO:()Private data:extensionPointID:context:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Skipping plugin %llx during enumeration because it is third-party", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
