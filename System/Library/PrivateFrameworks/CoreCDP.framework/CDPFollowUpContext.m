@implementation CDPFollowUpContext

+ (id)contextWithType:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setShouldNotify:", 1);
  objc_msgSend(v4, "setFollowUpType:", v3);

  return v4;
}

+ (id)_contextWithType:(id)a3 cdpContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a1, "contextWithType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAltDSID:", v8);

  objc_msgSend(v6, "telemetryFlowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTelemetryFlowID:", v9);

  objc_msgSend(v6, "telemetryDeviceSessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTelemetryDeviceSessionID:", v10);
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 141558274;
    v15 = 1752392040;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "\"CDPFollowUpContext: set altDSID to %{mask.hash}@\", (uint8_t *)&v14, 0x16u);

  }
  return v7;
}

+ (id)contextForOfflinePasscodeChange
{
  return (id)objc_msgSend(a1, "contextWithType:", CFSTR("kCDPOfflinePasscodeChange"));
}

+ (id)contextForRecoveryKeyRepair
{
  return (id)objc_msgSend(a1, "contextWithType:", CFSTR("kCDPRecoveryKeyRegenerate"));
}

+ (id)contextForSettingUpBiometrics
{
  return (id)objc_msgSend(a1, "contextWithType:", CFSTR("kCDPUpgradeSetupBioMetrics"));
}

+ (id)contextForSecureTerms
{
  return (id)objc_msgSend(a1, "contextWithType:", CFSTR("kCDPSecureTerms"));
}

+ (id)contextForConfirmExistingSecret
{
  return (id)objc_msgSend(a1, "contextWithType:", CFSTR("kCDPConfirmExistingSecret"));
}

+ (id)contextForWalrusCreatePasscodeWithCDPContext:(id)a3
{
  return (id)objc_msgSend(a1, "_contextWithType:cdpContext:", CFSTR("kWalrusCreatePasscode"), a3);
}

+ (id)contextForSOSCompatibilityMode
{
  NSObject *v3;
  void *v4;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[CDPFollowUpContext contextForSOSCompatibilityMode].cold.1();

  objc_msgSend(a1, "contextWithType:", CFSTR("kSOSCompatibilityMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRepairType:", 0);
  return v4;
}

+ (id)contextForRecoveryKeyMismatchHealing
{
  NSObject *v3;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[CDPFollowUpContext contextForRecoveryKeyMismatchHealing].cold.1();

  objc_msgSend(a1, "contextWithType:", CFSTR("kRecoveryKeyMismatchHealing"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)contextForADPUpsell
{
  NSObject *v3;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[CDPFollowUpContext contextForADPUpsell].cold.1();

  objc_msgSend(a1, "contextWithType:", CFSTR("kADPUpsell"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)contextForADPStateHealing
{
  NSObject *v3;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[CDPFollowUpContext contextForADPStateHealing].cold.1();

  objc_msgSend(a1, "contextWithType:", CFSTR("kADPStateHealing"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *followUpType;
  id v5;

  followUpType = self->_followUpType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", followUpType, CFSTR("_followUpType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldNotify, CFSTR("_shouldNotify"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_force, CFSTR("_force"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_repairType, CFSTR("_repairType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_telemetryFlowID, CFSTR("_telemetryFlowID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_telemetryDeviceSessionID, CFSTR("_telemetryDeviceSessionID"));

}

- (CDPFollowUpContext)initWithCoder:(id)a3
{
  id v4;
  CDPFollowUpContext *v5;
  uint64_t v6;
  NSString *followUpType;
  uint64_t v8;
  NSString *altDSID;
  uint64_t v10;
  NSString *telemetryFlowID;
  uint64_t v12;
  NSString *telemetryDeviceSessionID;

  v4 = a3;
  v5 = -[CDPFollowUpContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_followUpType"));
    v6 = objc_claimAutoreleasedReturnValue();
    followUpType = v5->_followUpType;
    v5->_followUpType = (NSString *)v6;

    v5->_shouldNotify = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldNotify"));
    v5->_force = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_force"));
    v5->_repairType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_repairType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_telemetryFlowID"));
    v10 = objc_claimAutoreleasedReturnValue();
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_telemetryDeviceSessionID"));
    v12 = objc_claimAutoreleasedReturnValue();
    telemetryDeviceSessionID = v5->_telemetryDeviceSessionID;
    v5->_telemetryDeviceSessionID = (NSString *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - type=%@ shouldNotify=%{BOOL}d force=%{BOOL}d>"), v4, self, self->_followUpType, self->_shouldNotify, self->_force);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (void)setShouldNotify:(BOOL)a3
{
  self->_shouldNotify = a3;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)telemetryDeviceSessionID
{
  return self->_telemetryDeviceSessionID;
}

- (void)setTelemetryDeviceSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)followUpType
{
  return self->_followUpType;
}

- (void)setFollowUpType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpType, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_telemetryDeviceSessionID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

+ (id)contextForStateRepair
{
  void *v2;

  objc_msgSend(a1, "contextWithType:", CFSTR("kCDPStateRepair"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRepairType:", 0);
  return v2;
}

- (unint64_t)repairType
{
  return self->_repairType;
}

- (void)setRepairType:(unint64_t)a3
{
  self->_repairType = a3;
}

+ (void)contextForSOSCompatibilityMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Creating context for SOS compatibility mode\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)contextForRecoveryKeyMismatchHealing
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Creating context for RK Healing CFU\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)contextForADPUpsell
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Creating context for ADP Upsell CFU\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)contextForADPStateHealing
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_20D7E6000, v0, v1, "\"Creating context for ADP State healing CFU\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
