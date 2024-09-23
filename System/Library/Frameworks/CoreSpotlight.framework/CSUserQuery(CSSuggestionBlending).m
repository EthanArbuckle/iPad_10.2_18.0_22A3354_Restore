@implementation CSUserQuery(CSSuggestionBlending)

+ (void)trimSuggestions:()CSSuggestionBlending options:peopleSelectedScope:isShortQuery:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v2, v3, "CSUserQuery: trimmed suggestions %lu", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)dedupedSuggestions:()CSSuggestionBlending queryContextScopeIsToPerson:options:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v2, v3, "CSUserQuery: deduped suggestions %lu", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_2_0();
}

+ (void)computeEmailAddressTopicalityScore:()CSSuggestionBlending inputEmailAddress:queryUnigrams:locale:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18C42F000, a1, a3, "Query string or email address is empty", a5, a6, a7, a8, 0);
}

+ (void)computeEmailAddressTopicalityScore:()CSSuggestionBlending inputEmailAddress:queryUnigrams:locale:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18C42F000, a1, a3, "Invalid email address since it does not have '@' character", a5, a6, a7, a8, 0);
}

+ (void)orderedSuggestions:()CSSuggestionBlending options:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0(a1, a2);
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v2, v3, "CSUserQuery: ordered suggestions %lu", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
