@implementation LAPSPasscodePersistenceMCAdapter

- (BOOL)hasPasscode
{
  void *v2;
  char v3;

  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (id)passcodeCreationDate
{
  void *v2;
  void *v3;

  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passcodeCreationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canChangePasscode
{
  void *v2;
  char v3;

  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeModificationAllowed");

  return v3;
}

- (BOOL)canRemovePasscode:(id *)a3
{
  void *v5;
  int v6;

  if (-[LAPSPasscodePersistenceMCAdapter canChangePasscode](self, "canChangePasscode"))
  {
    -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPasscodeRequired") ^ 1;

    if (!a3)
      return v6;
  }
  else
  {
    LOBYTE(v6) = 0;
    if (!a3)
      return v6;
  }
  if ((v6 & 1) == 0)
  {
    +[LAPSErrorBuilder deniedByMDMError](LAPSErrorBuilder, "deniedByMDMError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)passcodeType
{
  void *v3;
  _QWORD v5[5];

  if (-[LAPSPasscodePersistenceMCAdapter hasPasscode](self, "hasPasscode"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __48__LAPSPasscodePersistenceMCAdapter_passcodeType__block_invoke;
    v5[3] = &unk_24FDCE2A0;
    v5[4] = self;
    -[LAPSPasscodePersistenceMCAdapter _passcodeTypeForQuery:](self, "_passcodeTypeForQuery:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[LAPSPasscodeType noneType](LAPSPasscodeType, "noneType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

uint64_t __48__LAPSPasscodePersistenceMCAdapter_passcodeType__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_mcProfileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unlockScreenTypeWithOutSimplePasscodeType:", a2);

  return v4;
}

- (BOOL)changePasscode:(id)a3 to:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "changePasscodeFrom:to:skipRecovery:outError:", v11, v10, !v7, a6);

  return (char)a6;
}

- (id)simplestAllowedNewPasscodeType
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__LAPSPasscodePersistenceMCAdapter_simplestAllowedNewPasscodeType__block_invoke;
  v3[3] = &unk_24FDCE2A0;
  v3[4] = self;
  -[LAPSPasscodePersistenceMCAdapter _passcodeTypeForQuery:](self, "_passcodeTypeForQuery:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __66__LAPSPasscodePersistenceMCAdapter_simplestAllowedNewPasscodeType__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_mcProfileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", a2);

  return v4;
}

- (id)defaultNewPasscodeType
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__LAPSPasscodePersistenceMCAdapter_defaultNewPasscodeType__block_invoke;
  v3[3] = &unk_24FDCE2A0;
  v3[4] = self;
  -[LAPSPasscodePersistenceMCAdapter _passcodeTypeForQuery:](self, "_passcodeTypeForQuery:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __58__LAPSPasscodePersistenceMCAdapter_defaultNewPasscodeType__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_mcProfileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", a2);

  return v4;
}

- (id)localizedPasscodeRequirements
{
  void *v2;
  void *v3;

  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDescriptionOfDefaultNewPasscodeConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)verifyNewPasscodeMeetsPlatformRequirements:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "passcode:meetsCurrentConstraintsOutError:", v6, a4);

  return (char)a4;
}

- (id)recoveryPasscodeType
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__LAPSPasscodePersistenceMCAdapter_recoveryPasscodeType__block_invoke;
  v3[3] = &unk_24FDCE2A0;
  v3[4] = self;
  -[LAPSPasscodePersistenceMCAdapter _passcodeTypeForQuery:](self, "_passcodeTypeForQuery:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __56__LAPSPasscodePersistenceMCAdapter_recoveryPasscodeType__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_mcProfileConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "recoveryPasscodeUnlockScreenTypeWithOutSimplePasscodeType:", a2);

  return v4;
}

- (BOOL)isPasscodeRecoveryAvailable
{
  void *v2;
  char v3;

  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recoveryPasscodeAvailable");

  return v3;
}

- (BOOL)isPasscodeRecoveryEnabled
{
  void *v2;
  char v3;

  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeRecoveryAllowed");

  return v3;
}

- (id)setPasscodeRecoveryEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  LACLogPasscodeService();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "NO";
    if (v3)
      v5 = "YES";
    v7 = 136315138;
    v8 = v5;
    _os_log_impl(&dword_22FE91000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring request to set passcodeRecoveryEnabled = %s", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (BOOL)isPasscodeRecoverySupported
{
  void *v2;
  char v3;

  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeRecoverySupported");

  return v3;
}

- (BOOL)isPasscodeRecoveryRestricted
{
  void *v2;
  char v3;

  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeRecoveryRestricted");

  return v3;
}

- (BOOL)performRecovery:(id)a3 newPasscode:(id)a4 enableRecovery:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "changePasscodeWithRecoveryPasscode:to:skipRecovery:outError:", v11, v10, !v7, a6);

  return (char)a6;
}

- (id)clearRecoveryPasscode
{
  void *v2;
  void *v3;

  -[LAPSPasscodePersistenceMCAdapter _mcProfileConnection](self, "_mcProfileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearRecoveryPasscode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_mcProfileConnection
{
  return (id)objc_msgSend(MEMORY[0x24BE63CB8], "sharedConnection");
}

- (id)_passcodeTypeForQuery:(id)a3
{
  int v3;
  void *v4;
  int v6;

  v6 = -1;
  v3 = (*((uint64_t (**)(id, int *))a3 + 2))(a3, &v6);
  if (v3 == 2)
    goto LABEL_8;
  if (v3 == 1)
  {
    +[LAPSPasscodeType numericCustomDigitsType](LAPSPasscodeType, "numericCustomDigitsType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (v3)
    goto LABEL_8;
  if (v6 == 1)
  {
    +[LAPSPasscodeType numericSixDigitsType](LAPSPasscodeType, "numericSixDigitsType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (!v6)
  {
    +[LAPSPasscodeType numericFourDigitsType](LAPSPasscodeType, "numericFourDigitsType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (v6 != -1)
  {
LABEL_8:
    +[LAPSPasscodeType alphanumericType](LAPSPasscodeType, "alphanumericType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[LAPSPasscodeType noneType](LAPSPasscodeType, "noneType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
