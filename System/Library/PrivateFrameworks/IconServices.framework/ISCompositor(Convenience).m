@implementation ISCompositor(Convenience)

- (void)setRecipe:()Convenience .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1AA928000, a1, a3, "Failed to set recipe on custom element", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)setResource:()Convenience named:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1AA928000, a2, a3, "Failed to set resource named '%@' on custom element", (uint8_t *)&v3);
}

- (void)addResourcesFromDictionary:()Convenience .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_4(&dword_1AA928000, a2, v4, "Failed to set resource names '%@' on custom element", (uint8_t *)&v5);

}

- (void)clearResources
{
  OUTLINED_FUNCTION_0_3(&dword_1AA928000, a1, a3, "Failed to clear resources from custom element", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
