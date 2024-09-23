@implementation ISAliasIcon(Factory)

+ (void)_iconForValues:()Factory .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "Creating kUnknownFSObjectIcon icon bookmark", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_iconForValues:()Factory .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "Creating Bundle Identifier icon for bookmark", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_iconForValues:()Factory .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, a2, a3, "Creating File Extension icon for package bookmark: %@ ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForValues:()Factory .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AA928000, a2, a3, "Creating File Extension icon for file bookmark: %@ ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForValues:()Factory .cold.5()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_2();
  v3 = v0;
  _os_log_debug_impl(&dword_1AA928000, v1, OS_LOG_TYPE_DEBUG, "Identified custom folder type %@ for URL: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

+ (void)_iconForValues:()Factory .cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, v0, v1, "Creating Folder icon  for bookmark", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
