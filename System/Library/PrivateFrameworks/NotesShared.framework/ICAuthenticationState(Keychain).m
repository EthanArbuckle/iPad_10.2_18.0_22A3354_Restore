@implementation ICAuthenticationState(Keychain)

- (void)biometricsEnabledForAccount:()Keychain .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot retrieve biometrics enabled for account without identifier {account: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)setBiometricsEnabled:()Keychain forAccount:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot set biometrics enabled for account without identifier {account: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)addMainKeyToKeychainForObject:()Keychain .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Cannot retrieve main key to add to Keychain {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)removeMainKeysFromKeychainForAccount:()Keychain .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot remove main keys from Keychain for account without identifier {account: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)removeMainKeysFromKeychainForAccount:()Keychain .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot remove main keys from Keychain {account: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)removeAllMainKeysFromKeychain
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Cannot remove main keys from Keychain", v1, 2u);
}

- (void)setMainKeyInKeychain:()Keychain forObject:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot add main key to Keychain for object without identifier {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)setMainKeyInKeychain:()Keychain forObject:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Removed main key from Keychain {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)setMainKeyInKeychain:()Keychain forObject:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1BD918000, a3, OS_LOG_TYPE_ERROR, "Cannot set main key in Keychain {object: %@, error: %@}", v6, 0x16u);

}

- (void)setMainKeyInKeychain:()Keychain forObject:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot set main key in Keychain because it doesn't decrypt object {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
