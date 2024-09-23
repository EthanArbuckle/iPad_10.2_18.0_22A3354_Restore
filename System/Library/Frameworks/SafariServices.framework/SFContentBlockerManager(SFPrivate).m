@implementation SFContentBlockerManager(SFPrivate)

+ (void)_createContentExtensionsDirectoryWithURL:()SFPrivate .cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Failed to exclude ContentExtensions directory from backup: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)_saveContentBlockerRecompilationInformation
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Failed to create data to save recompilation information: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

@end
