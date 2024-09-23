@implementation LSApplicationWorkspace(DeprecatedURLQueries)

- (void)publicURLSchemes
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  getprogname();
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_4_0(&dword_182882000, a2, v3, "Process %{public}s is using -%{public}s, which is no longer functional.", v4);
  OUTLINED_FUNCTION_18_0();
}

@end
