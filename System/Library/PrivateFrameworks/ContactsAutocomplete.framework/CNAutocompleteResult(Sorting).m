@implementation CNAutocompleteResult(Sorting)

- (void)compare:()Sorting .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1B9950000, a2, OS_LOG_TYPE_DEBUG, "Comparison result: %ld", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
