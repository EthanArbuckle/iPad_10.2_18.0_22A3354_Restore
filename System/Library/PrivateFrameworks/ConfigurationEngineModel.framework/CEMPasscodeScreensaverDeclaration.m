@implementation CEMPasscodeScreensaverDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.passcode.screensaver");
}

+ (id)profileType
{
  return CFSTR("com.apple.screensaver");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("askForPassword");
  v6[1] = CFSTR("askForPasswordDelay");
  v6[2] = CFSTR("loginWindowIdleTime");
  v6[3] = CFSTR("loginWindowModulePath");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withAskForPassword:(id)a4 withAskForPasswordDelay:(id)a5 withLoginWindowIdleTime:(id)a6 withLoginWindowModulePath:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.passcode.screensaver"));
  if (v11)
  {
    objc_msgSend(v16, "setDeclarationIdentifier:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDeclarationIdentifier:", v18);

  }
  if (v15)
    v19 = v15;
  else
    v19 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v16, "setPayloadAskForPassword:", v19);

  objc_msgSend(v16, "setPayloadAskForPasswordDelay:", v14);
  objc_msgSend(v16, "setPayloadLoginWindowIdleTime:", v13);

  objc_msgSend(v16, "setPayloadLoginWindowModulePath:", v12);
  objc_msgSend(v16, "updateServerHash");

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.passcode.screensaver"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerHash");

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSNumber *v13;
  id v14;
  NSNumber *payloadAskForPassword;
  NSNumber *v16;
  NSNumber *payloadAskForPasswordDelay;
  NSNumber *v18;
  NSNumber *payloadLoginWindowIdleTime;
  NSString *v20;
  NSString *payloadLoginWindowModulePath;
  id v23;
  id v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMPasscodeScreensaverDeclaration allowedPayloadKeys](CEMPasscodeScreensaverDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("askForPassword"), 0, MEMORY[0x24BDBD1C0], &v26);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadAskForPassword = self->_payloadAskForPassword;
  self->_payloadAskForPassword = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("askForPasswordDelay"), 0, 0, &v25);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadAskForPasswordDelay = self->_payloadAskForPasswordDelay;
    self->_payloadAskForPasswordDelay = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("loginWindowIdleTime"), 0, 0, &v24);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadLoginWindowIdleTime = self->_payloadLoginWindowIdleTime;
      self->_payloadLoginWindowIdleTime = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("loginWindowModulePath"), 0, 0, &v23);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadLoginWindowModulePath = self->_payloadLoginWindowModulePath;
        self->_payloadLoginWindowModulePath = v20;

      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("askForPassword"), self->_payloadAskForPassword, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("askForPasswordDelay"), self->_payloadAskForPasswordDelay, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("loginWindowIdleTime"), self->_payloadLoginWindowIdleTime, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("loginWindowModulePath"), self->_payloadLoginWindowModulePath, 0, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMPasscodeScreensaverDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAskForPassword, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAskForPasswordDelay, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadLoginWindowIdleTime, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSString copy](self->_payloadLoginWindowModulePath, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSNumber)payloadAskForPassword
{
  return self->_payloadAskForPassword;
}

- (void)setPayloadAskForPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAskForPasswordDelay
{
  return self->_payloadAskForPasswordDelay;
}

- (void)setPayloadAskForPasswordDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadLoginWindowIdleTime
{
  return self->_payloadLoginWindowIdleTime;
}

- (void)setPayloadLoginWindowIdleTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadLoginWindowModulePath
{
  return self->_payloadLoginWindowModulePath;
}

- (void)setPayloadLoginWindowModulePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLoginWindowModulePath, 0);
  objc_storeStrong((id *)&self->_payloadLoginWindowIdleTime, 0);
  objc_storeStrong((id *)&self->_payloadAskForPasswordDelay, 0);
  objc_storeStrong((id *)&self->_payloadAskForPassword, 0);
}

@end
