@implementation DKPasscodeProvider

- (BOOL)isDevicePasscodeSet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (int)unlockType
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unlockScreenType");

  return v3;
}

- (int)simplePasscodeType
{
  void *v2;
  int v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unlockScreenTypeWithOutSimplePasscodeType:", &v4);

  return v4;
}

- (BOOL)verifyPasscode:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  int v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BE63CB0];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = objc_msgSend(v6, "unlockDeviceWithPasscode:outError:", v5, &v14);

  v8 = v14;
  if ((v7 & 1) == 0)
  {
    _DKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if ((_DKIsInternalInstall() & 1) != 0)
      {
        v11 = 0;
        v12 = v8;
      }
      else if (v8)
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v8, "domain");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v8, "code"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 1;
      }
      else
      {
        v11 = 0;
        v12 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_error_impl(&dword_229405000, v9, OS_LOG_TYPE_ERROR, "Failed to verify passcode: %{public}@", buf, 0xCu);
      if (v11)
      {

      }
    }

  }
  return v7;
}

- (BOOL)isScreenTimePasscodeSet
{
  return objc_msgSend(MEMORY[0x24BE85718], "settingEnabled");
}

- (BOOL)verifyScreenTimePasscode:(id)a3
{
  return objc_msgSend(MEMORY[0x24BE85718], "validatePIN:", a3);
}

@end
