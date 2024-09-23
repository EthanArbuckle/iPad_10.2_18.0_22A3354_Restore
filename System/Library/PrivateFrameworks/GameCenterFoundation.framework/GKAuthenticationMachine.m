@implementation GKAuthenticationMachine

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)authMachineForEnvironment:(int64_t)a3
{
  return 0;
}

- (GKAuthenticationMachine)initWithCoder:(id)a3
{
  id v4;
  GKAuthenticationMachine *v5;
  uint64_t v6;
  NSString *accountName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKAuthenticationMachine;
  v5 = -[GKAuthenticationMachine init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountName"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountName = v5->_accountName;
    v5->_accountName = (NSString *)v6;

    v5->_serverEnvironment = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("serverEnvironment"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKAuthenticationMachine accountName](self, "accountName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("accountName"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[GKAuthenticationMachine serverEnvironment](self, "serverEnvironment"), CFSTR("serverEnvironment"));

}

+ (void)migratePreBlacktailAccountInformation
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v0, v1, "error while decoding GKProductionMachine archive:%@", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)migratePreSundanceAccountInformation
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1BCDE3000, v1, OS_LOG_TYPE_DEBUG, "--> INCOMPLETE TRANSFER PRE-SUNDANCE playerID:%@ token:%@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __63__GKAuthenticationMachine_migratePreSundanceAccountInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (v2)
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __63__GKAuthenticationMachine_migratePreSundanceAccountInformation__block_invoke_cold_1();
  }

}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
  objc_storeStrong((id *)&self->_accountName, a3);
}

- (int64_t)serverEnvironment
{
  return self->_serverEnvironment;
}

- (void)setServerEnvironment:(int64_t)a3
{
  self->_serverEnvironment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountName, 0);
}

void __63__GKAuthenticationMachine_migratePreSundanceAccountInformation__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1BCDE3000, v0, v1, "TRANSFER PRE-SUNDANCE: failed to set credential: %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
