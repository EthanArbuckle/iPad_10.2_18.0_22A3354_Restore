@implementation _DKEvent(INInteraction)

+ (void)relatedContactIdentifiersFromIntent:()INInteraction .cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_18DDBE000, v1, OS_LOG_TYPE_DEBUG, "Found contact identifiers of %@ from intent: %@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)interaction
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "stream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v5, "Cannot convert event of stream %@ to INInteraction", v6);

}

- (void)fetchInteractionWithPopulatedKeyImage:()INInteraction .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "Synced interaction has a key image proxy and no serialized key image data.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)fetchInteractionWithPopulatedKeyImage:()INInteraction .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v0, v1, "Error unarchiving interaction key image: %@", v2);
  OUTLINED_FUNCTION_5();
}

@end
