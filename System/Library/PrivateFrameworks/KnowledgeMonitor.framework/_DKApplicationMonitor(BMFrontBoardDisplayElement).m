@implementation _DKApplicationMonitor(BMFrontBoardDisplayElement)

- (void)donateElementsFromDisplayLayout:()BMFrontBoardDisplayElement withContext:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_4(&dword_219056000, a1, a3, "BMFrontBoardDisplayElement - Current state END   ------------------------", v3);
}

- (void)donateElementsFromDisplayLayout:()BMFrontBoardDisplayElement withContext:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_4(&dword_219056000, a1, a3, "BMFrontBoardDisplayElement - Current state BEGIN -----------------------", v3);
}

- (void)donateElementsFromDisplayLayout:()BMFrontBoardDisplayElement withContext:.cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_4(&dword_219056000, a3, (uint64_t)a3, "BMFrontBoardDisplayElement - Skipping modify element update due to it being a duplicate of an existing event", a1);
}

- (void)_updateCurrentElementsWithDisplayElement:()BMFrontBoardDisplayElement .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_219056000, a2, OS_LOG_TYPE_ERROR, "BMFrontBoardDisplayElement - Updating current elements state received malformed biome display element event, skipping: %@", (uint8_t *)&v2, 0xCu);
}

@end
