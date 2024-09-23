@implementation CSSearchableItem(Internal)

- (void)_standardizeFileProvider:()Internal .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_1_2(&dword_18C42F000, a3, (uint64_t)a3, "Could not get properties from contentURL: %@ (error: %@)", (uint8_t *)&v3);
}

- (void)_standardizeExternalAnalysisTags:()Internal forAttributeSet:primaryAttribute:analysisAttribibutes:specializedAttributes:standardizeBlock:.cold.1()
{
  __assert_rtn("-[CSSearchableItem(Internal) _standardizeExternalAnalysisTags:forAttributeSet:primaryAttribute:analysisAttribibutes:specializedAttributes:standardizeBlock:]", "CSSearchableItem.m", 1312, "analysisAttributes.count == 4");
}

- (void)_fixBrokenAuthorNames:()Internal .cold.1(uint64_t a1, NSObject *a2, _QWORD *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  *a3 = CFSTR("kMDItemRecipients");
  v6 = OUTLINED_FUNCTION_0_2(v5);
  OUTLINED_FUNCTION_1_2(&dword_18C42F000, a2, v7, "Invalid type:%@ for attribute:%@", v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fixBrokenAuthorNames:()Internal .cold.2(uint64_t a1, NSObject *a2, _QWORD *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  *a3 = CFSTR("kMDItemAuthors");
  v6 = OUTLINED_FUNCTION_0_2(v5);
  OUTLINED_FUNCTION_1_2(&dword_18C42F000, a2, v7, "Invalid type:%@ for attribute:%@", v8);

  OUTLINED_FUNCTION_2_0();
}

@end
