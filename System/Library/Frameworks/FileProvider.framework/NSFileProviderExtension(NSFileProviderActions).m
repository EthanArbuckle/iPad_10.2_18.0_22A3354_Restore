@implementation NSFileProviderExtension(NSFileProviderActions)

- (void)importDocumentAtURL:()NSFileProviderActions toParentItemIdentifier:completionHandler:.cold.1()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_27_0();
  v1 = (void *)OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_5_6(v1);
  v2 = (const char *)OUTLINED_FUNCTION_7_6();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v4, v5, "[ERROR] %@ must implement method %@ and not call super", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)setLastUsedDate:()NSFileProviderActions forItemIdentifier:completionHandler:.cold.1()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_27_0();
  v1 = (void *)OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_5_6(v1);
  v2 = (const char *)OUTLINED_FUNCTION_7_6();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v4, v5, "[DEBUG] %@ must implement method %@ and not call super", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

@end
