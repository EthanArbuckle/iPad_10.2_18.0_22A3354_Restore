@implementation AKAppleIDSigningController(Convenience)

- (void)_parseDERCertificatesFromChain:()Convenience error:.cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 2048;
  v6 = v3;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Failed to parse certificate set. rc=%d, numCerts=%zu", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)_parseDERCertificatesFromChain:()Convenience error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Invalid certData", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
