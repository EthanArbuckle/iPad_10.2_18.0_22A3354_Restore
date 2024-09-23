@implementation HDKeyValueDomain(AFibBurdenNotificationManagerAdherence)

- (void)setNotificationSentDate:()AFibBurdenNotificationManagerAdherence
{
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;

  v3 = *MEMORY[0x1E0D2FA88];
  v7 = 0;
  v4 = objc_msgSend(a1, "setDate:forKey:error:", a3, v3, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[HDKeyValueDomain(AFibBurdenNotificationManagerAdherence) setNotificationSentDate:].cold.1();

  }
}

- (void)setNotificationSentDate:()AFibBurdenNotificationManagerAdherence .cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_3(&dword_1CC29C000, v0, (uint64_t)v0, "[%{public}@] Failed to write notification last sent date due to error %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

@end
