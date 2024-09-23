@implementation CDPAccount(Probation)

- (void)rpdProbationFirstSeenDate
{
  OUTLINED_FUNCTION_7(&dword_20D7E6000, a2, a3, "\"RPD Probation: date from accountProperties: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)setRpdProbationFirstSeenDate:()Probation .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_ERROR, "\"Failed to set RPD Probation date: %@\", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)setRpdProbationFirstSeenDate:()Probation .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20D7E6000, a2, a3, "\"RPD Probation: Set date in accountProperties: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)rpdProbationIsInEffectForDuration:()Probation context:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20D7E6000, a1, a3, "\"RPD Probation period: %f secs\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)rpdProbationIsInEffectForDuration:()Probation context:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20D7E6000, a1, a3, "\"RPD Probation: Elapsed time since user first exhausted all recovery options: %f\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
