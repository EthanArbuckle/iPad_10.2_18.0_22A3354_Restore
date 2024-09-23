@implementation CDPContext(Account)

+ (void)preflightContext:()Account .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0();
}

+ (void)preflightContext:()Account .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_16(&dword_20D7E6000, v0, v1, "\"preflightContext: FAILED TO FIND ACCOUNT – Context will not be properly initted and major issues may follow.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)preflightContext:()Account .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"preflightContext: Incoming context did not provide a DSID/altDSID/appleID. Defaulting to using the primary account info. Please get a context using +[CDPContext contextForPrimaryAccount] if this was the intended behavior.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)preflightContext:()Account .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"preflightContext: Incoming context was initialized using a deprecated method. Please use one of the newer class-level inits.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)preflightContext:()Account .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "appleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  _os_log_error_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_ERROR, "\"Failed to find account for appleID: %@\", v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

+ (void)preflightContext:()Account .cold.6(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dsid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6(&dword_20D7E6000, a2, v4, "\"Failed to find account for dsid: %{mask.hash}@\", v5);

  OUTLINED_FUNCTION_1();
}

+ (void)preflightContext:()Account .cold.7(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6(&dword_20D7E6000, a2, v4, "\"Failed to find account for altDSID: %{mask.hash}@\", v5);

  OUTLINED_FUNCTION_1();
}

+ (void)preflightContext:()Account .cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Context was properly initted, skipping preflight\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
