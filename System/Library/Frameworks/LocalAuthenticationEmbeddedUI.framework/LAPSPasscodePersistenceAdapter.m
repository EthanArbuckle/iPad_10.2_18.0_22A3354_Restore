@implementation LAPSPasscodePersistenceAdapter

- (LAPSPasscodePersistenceAdapter)init
{
  LAPSPasscodePersistenceAdapter *v2;
  LAPSPasscodePersistenceLAAdapter *v3;
  LAPSPasscodePersistenceLAAdapter *laAdapter;
  LAPSPasscodePersistenceMCAdapter *v5;
  LAPSPasscodePersistenceMCAdapter *mcAdapter;
  LAPSPasscodePersistenceCDPAdapter *v7;
  LAPSPasscodePersistenceCDPAdapter *cdpAdapter;
  LAPSPasscodePersistenceMKBAdapter *v9;
  LAPSPasscodePersistenceMKBAdapter *mkbAdapter;
  LAPSPasscodePersistenceSecAdapter *v11;
  LAPSPasscodePersistenceSecAdapter *secAdapter;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)LAPSPasscodePersistenceAdapter;
  v2 = -[LAPSPasscodePersistenceAdapter init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(LAPSPasscodePersistenceLAAdapter);
    laAdapter = v2->_laAdapter;
    v2->_laAdapter = v3;

    v5 = objc_alloc_init(LAPSPasscodePersistenceMCAdapter);
    mcAdapter = v2->_mcAdapter;
    v2->_mcAdapter = v5;

    v7 = objc_alloc_init(LAPSPasscodePersistenceCDPAdapter);
    cdpAdapter = v2->_cdpAdapter;
    v2->_cdpAdapter = v7;

    v9 = objc_alloc_init(LAPSPasscodePersistenceMKBAdapter);
    mkbAdapter = v2->_mkbAdapter;
    v2->_mkbAdapter = v9;

    v11 = objc_alloc_init(LAPSPasscodePersistenceSecAdapter);
    secAdapter = v2->_secAdapter;
    v2->_secAdapter = v11;

  }
  return v2;
}

- (BOOL)hasPasscode
{
  return -[LAPSPasscodePersistenceMCAdapter hasPasscode](self->_mcAdapter, "hasPasscode");
}

- (id)passcodeCreationDate
{
  return -[LAPSPasscodePersistenceMCAdapter passcodeCreationDate](self->_mcAdapter, "passcodeCreationDate");
}

- (BOOL)canChangePasscode
{
  return -[LAPSPasscodePersistenceMCAdapter canChangePasscode](self->_mcAdapter, "canChangePasscode");
}

- (BOOL)canRemovePasscode:(id *)a3
{
  _BOOL4 v5;

  v5 = -[LAPSPasscodePersistenceMCAdapter canRemovePasscode:](self->_mcAdapter, "canRemovePasscode:");
  if (v5)
    LOBYTE(v5) = -[LAPSPasscodePersistenceLAAdapter canRemovePasscode:](self->_laAdapter, "canRemovePasscode:", a3);
  return v5;
}

- (id)passcodeType
{
  return -[LAPSPasscodePersistenceMCAdapter passcodeType](self->_mcAdapter, "passcodeType");
}

- (id)backoffTimeout
{
  return -[LAPSPasscodePersistenceMKBAdapter backoffTimeout](self->_mkbAdapter, "backoffTimeout");
}

- (id)failedPasscodeAttempts
{
  return -[LAPSPasscodePersistenceMKBAdapter failedPasscodeAttempts](self->_mkbAdapter, "failedPasscodeAttempts");
}

- (id)verifyPasscode:(id)a3
{
  LAPSPasscodePersistenceMKBAdapter *mkbAdapter;
  void *v4;
  void *v5;

  mkbAdapter = self->_mkbAdapter;
  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodePersistenceMKBAdapter verifyPasscode:](mkbAdapter, "verifyPasscode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  LAPSPasscodePersistenceMCAdapter *mcAdapter;
  id v10;
  void *v11;
  void *v12;

  v7 = a5;
  mcAdapter = self->_mcAdapter;
  v10 = a4;
  objc_msgSend(a3, "passcode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passcode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = -[LAPSPasscodePersistenceMCAdapter changePasscode:to:enableRecovery:error:](mcAdapter, "changePasscode:to:enableRecovery:error:", v11, v12, v7, a6);
  return (char)a6;
}

- (id)simplestAllowedNewPasscodeType
{
  return -[LAPSPasscodePersistenceMCAdapter simplestAllowedNewPasscodeType](self->_mcAdapter, "simplestAllowedNewPasscodeType");
}

- (id)defaultNewPasscodeType
{
  return -[LAPSPasscodePersistenceMCAdapter defaultNewPasscodeType](self->_mcAdapter, "defaultNewPasscodeType");
}

- (id)localizedPasscodeRequirements
{
  return -[LAPSPasscodePersistenceMCAdapter localizedPasscodeRequirements](self->_mcAdapter, "localizedPasscodeRequirements");
}

- (BOOL)verifyNewPasscodeMeetsPlatformRequirements:(id)a3 error:(id *)a4
{
  LAPSPasscodePersistenceMCAdapter *mcAdapter;
  void *v6;

  mcAdapter = self->_mcAdapter;
  objc_msgSend(a3, "passcode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[LAPSPasscodePersistenceMCAdapter verifyNewPasscodeMeetsPlatformRequirements:error:](mcAdapter, "verifyNewPasscodeMeetsPlatformRequirements:error:", v6, a4);

  return (char)a4;
}

- (BOOL)verifyFixedLengthNumericPasscodeIsStrong:(id)a3
{
  LAPSPasscodePersistenceSecAdapter *secAdapter;
  void *v4;

  secAdapter = self->_secAdapter;
  objc_msgSend(a3, "passcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(secAdapter) = -[LAPSPasscodePersistenceSecAdapter verifyFixedLengthNumericPasscodeIsStrong:](secAdapter, "verifyFixedLengthNumericPasscodeIsStrong:", v4);

  return (char)secAdapter;
}

- (BOOL)verifyVariableLengthAlphanumericPasscodeIsStrong:(id)a3
{
  LAPSPasscodePersistenceSecAdapter *secAdapter;
  void *v4;

  secAdapter = self->_secAdapter;
  objc_msgSend(a3, "passcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(secAdapter) = -[LAPSPasscodePersistenceSecAdapter verifyVariableLengthAlphanumericPasscodeIsStrong:](secAdapter, "verifyVariableLengthAlphanumericPasscodeIsStrong:", v4);

  return (char)secAdapter;
}

- (void)reportPasscodeDidChangeTo:(id)a3 completion:(id)a4
{
  LAPSPasscodePersistenceCDPAdapter *cdpAdapter;
  id v6;
  id v7;
  void *v8;
  id v9;

  cdpAdapter = self->_cdpAdapter;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "passcode");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[LAPSPasscodePersistenceCDPAdapter reportPasscodeDidChangeTo:passcodeType:completion:](cdpAdapter, "reportPasscodeDidChangeTo:passcodeType:completion:", v9, v8, v6);
}

- (id)recoveryPasscodeType
{
  return -[LAPSPasscodePersistenceMCAdapter recoveryPasscodeType](self->_mcAdapter, "recoveryPasscodeType");
}

- (BOOL)isPasscodeRecoveryAvailable
{
  return -[LAPSPasscodePersistenceMCAdapter isPasscodeRecoveryAvailable](self->_mcAdapter, "isPasscodeRecoveryAvailable");
}

- (BOOL)isPasscodeRecoveryEnabled
{
  return -[LAPSPasscodePersistenceMCAdapter isPasscodeRecoveryEnabled](self->_mcAdapter, "isPasscodeRecoveryEnabled");
}

- (id)setPasscodeRecoveryEnabled:(BOOL)a3
{
  return -[LAPSPasscodePersistenceMCAdapter setPasscodeRecoveryEnabled:](self->_mcAdapter, "setPasscodeRecoveryEnabled:", a3);
}

- (BOOL)isPasscodeRecoverySupported
{
  return -[LAPSPasscodePersistenceMCAdapter isPasscodeRecoverySupported](self->_mcAdapter, "isPasscodeRecoverySupported");
}

- (BOOL)isPasscodeRecoveryRestricted
{
  return -[LAPSPasscodePersistenceMCAdapter isPasscodeRecoveryRestricted](self->_mcAdapter, "isPasscodeRecoveryRestricted");
}

- (BOOL)isPasscodeLockedOut
{
  return -[LAPSPasscodePersistenceMKBAdapter isPasscodeLockedOut](self->_mkbAdapter, "isPasscodeLockedOut");
}

- (id)verifyRecoveryPasscode:(id)a3
{
  LAPSPasscodePersistenceMKBAdapter *mkbAdapter;
  void *v4;
  void *v5;

  mkbAdapter = self->_mkbAdapter;
  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodePersistenceMKBAdapter verifyRecoveryPasscode:](mkbAdapter, "verifyRecoveryPasscode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)performRecovery:(id)a3 newPasscode:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  LAPSPasscodePersistenceMCAdapter *mcAdapter;
  id v10;
  void *v11;
  void *v12;

  v7 = a5;
  mcAdapter = self->_mcAdapter;
  v10 = a4;
  objc_msgSend(a3, "passcode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passcode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = -[LAPSPasscodePersistenceMCAdapter performRecovery:newPasscode:enableRecovery:error:](mcAdapter, "performRecovery:newPasscode:enableRecovery:error:", v11, v12, v7, a6);
  return (char)a6;
}

- (id)clearRecoveryPasscode
{
  return -[LAPSPasscodePersistenceMCAdapter clearRecoveryPasscode](self->_mcAdapter, "clearRecoveryPasscode");
}

- (id)failedPasscodeRecoveryAttempts
{
  return -[LAPSPasscodePersistenceMKBAdapter failedPasscodeRecoveryAttempts](self->_mkbAdapter, "failedPasscodeRecoveryAttempts");
}

- (id)maxPasscodeRecoveryAttempts
{
  return -[LAPSPasscodePersistenceMKBAdapter maxPasscodeRecoveryAttempts](self->_mkbAdapter, "maxPasscodeRecoveryAttempts");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secAdapter, 0);
  objc_storeStrong((id *)&self->_mkbAdapter, 0);
  objc_storeStrong((id *)&self->_cdpAdapter, 0);
  objc_storeStrong((id *)&self->_mcAdapter, 0);
  objc_storeStrong((id *)&self->_laAdapter, 0);
}

@end
