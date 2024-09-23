@implementation AAFollowUpController(Convenience)

- (void)dismissFollowUpsStartingWithIdentifierPrefix:()Convenience account:completion:.cold.1()
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
  _os_log_debug_impl(&dword_19EACA000, v1, OS_LOG_TYPE_DEBUG, "Attempting to teardown followups starting with identifier %@ for account: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)isRenewCredentialsCFUPosted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to fetch pending renew credentials CFU, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)creationDateOfOldestFollowUpWithIdentifiers:()Convenience .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to fetch pending CFUs, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)creationDateOfOldestFollowUpWithIdentifiers:()Convenience .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "No follow ups with valid creation date found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)creationDateOfOldestFollowUpWithIdentifiers:()Convenience .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19EACA000, v0, v1, "Attempting to fetch pending CFUs - %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)pendingFollowUpItemUserInfosWithIdentifier:()Convenience .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to fetch pending follow ups with Identifieer: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_pendingFollowUpItemsWithIdentifier:()Convenience forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Failed to fetch pending CFUs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_pendingFollowUpItemsWithIdentifier:()Convenience forAccount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "Attempting to fetch pending CFUs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
