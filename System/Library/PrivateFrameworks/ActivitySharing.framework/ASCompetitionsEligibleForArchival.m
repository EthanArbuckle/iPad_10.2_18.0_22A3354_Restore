@implementation ASCompetitionsEligibleForArchival

uint64_t __ASCompetitionsEligibleForArchival_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "lastPushedCacheIndex"))
  {
    v3 = objc_msgSend(v2, "lastPushedCacheIndex");
    if (v3 >= objc_msgSend(v2, "endDateCacheIndex"))
    {
      v4 = 1;
      goto LABEL_9;
    }
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
      __ASCompetitionsEligibleForArchival_block_invoke_cold_2();
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR))
      __ASCompetitionsEligibleForArchival_block_invoke_cold_1();
  }
  v4 = 0;
LABEL_9:

  return v4;
}

void __ASCompetitionsEligibleForArchival_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_21381F000, v0, v1, "Competition lastPushedCacheIndex is zero, not eligible: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __ASCompetitionsEligibleForArchival_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_21381F000, v0, v1, "Competition lastPushedCacheIndex is less than endDate, not eligible: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
