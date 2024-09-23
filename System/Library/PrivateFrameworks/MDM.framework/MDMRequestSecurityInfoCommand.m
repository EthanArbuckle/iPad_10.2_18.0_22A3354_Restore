@implementation MDMRequestSecurityInfoCommand

+ (id)requestType
{
  return CFSTR("SecurityInfo");
}

+ (unint64_t)requiredAccessRights
{
  return 1024;
}

+ (id)request
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDMRequestSecurityInfoCommand;
  return -[RMModelPayloadBase copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a4;
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE63C20], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v9 = objc_msgSend(v6, "supportsBlockLevelEncryption");
  if (objc_msgSend(v6, "supportsFileLevelEncryption"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("HardwareEncryptionCaps"));

  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isUserEnrollment");

  v27 = CFSTR("IsUserEnrollment");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("ManagementStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "currentPasscodeIsCompliantWithGlobalRestrictionsOutError:", 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("PasscodeCompliant"));

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "isPasscodeSet"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v17, CFSTR("PasscodePresent"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "currentPasscodeIsCompliantWithProfileRestrictionsOutError:", 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v18, CFSTR("PasscodeCompliantWithProfiles"));

    v19 = (void *)MEMORY[0x24BDD16E0];
    v20 = *MEMORY[0x24BE63A40];
    objc_msgSend(v7, "effectiveValueForSetting:", *MEMORY[0x24BE63A40]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v21, "unsignedIntegerValue"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v22, CFSTR("PasscodeLockGracePeriodEnforced"));

    v23 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "userValueForSetting:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "unsignedIntegerValue"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v25, CFSTR("PasscodeLockGracePeriod"));

    if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
    {
      objc_msgSend(v7, "effectiveValueForSetting:", *MEMORY[0x24BE637F8]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v26, CFSTR("AutoLockTime"));

    }
  }
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("SecurityInfo"));
  v4[2](v4, v5);

}

@end
