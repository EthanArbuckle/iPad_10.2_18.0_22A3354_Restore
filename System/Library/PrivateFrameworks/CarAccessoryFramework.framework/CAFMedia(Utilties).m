@implementation CAFMedia(Utilties)

- (void)tuneToMediaItem:()Utilties inSource:completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_237717000, log, OS_LOG_TYPE_DEBUG, "Tuning to mediaItem %@ in source %@", (uint8_t *)&v3, 0x16u);
}

- (void)tuneToFrequency:()Utilties inSourceWithIdentifier:completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_237717000, a1, a3, "No now playing service found!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_15();
}

- (void)tuneToFrequency:()Utilties inSourceWithIdentifier:completion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_237717000, a1, a3, "Frequency does not adhere to min/max!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_15();
}

@end
