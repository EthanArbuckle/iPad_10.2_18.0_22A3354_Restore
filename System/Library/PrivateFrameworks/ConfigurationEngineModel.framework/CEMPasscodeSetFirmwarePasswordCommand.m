@implementation CEMPasscodeSetFirmwarePasswordCommand

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Commands");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.command.passcode.firmware.set");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("CurrentPassword");
  v6[1] = CFSTR("NewPassword");
  v6[2] = CFSTR("AllowOroms");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)executionLevel
{
  return 0;
}

+ (id)buildWithIdentifier:(id)a3 withCurrentPassword:(id)a4 withNewPassword:(id)a5 withAllowOroms:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setCommandType:", CFSTR("com.apple.command.passcode.firmware.set"));
  if (v9)
  {
    objc_msgSend(v13, "setCommandIdentifier:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCommandIdentifier:", v15);

  }
  objc_msgSend(v13, "setPayloadCurrentPassword:", v12);

  objc_msgSend(v13, "setPayloadNewPassword:", v11);
  if (v10)
    v16 = v10;
  else
    v16 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v13, "setPayloadAllowOroms:", v16);

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withNewPassword:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCommandType:", CFSTR("com.apple.command.passcode.firmware.set"));
  if (v5)
  {
    objc_msgSend(v7, "setCommandIdentifier:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCommandIdentifier:", v9);

  }
  objc_msgSend(v7, "setPayloadNewPassword:", v6);

  return v7;
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
  NSString *v13;
  id v14;
  NSString *payloadCurrentPassword;
  NSString *v16;
  NSString *payloadNewPassword;
  NSNumber *v18;
  NSNumber *payloadAllowOroms;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMPasscodeSetFirmwarePasswordCommand allowedPayloadKeys](CEMPasscodeSetFirmwarePasswordCommand, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CurrentPassword"), 0, 0, &v23);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadCurrentPassword = self->_payloadCurrentPassword;
  self->_payloadCurrentPassword = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("NewPassword"), 1, 0, &v22);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadNewPassword = self->_payloadNewPassword;
    self->_payloadNewPassword = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AllowOroms"), 0, MEMORY[0x24BDBD1C0], &v21);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadAllowOroms = self->_payloadAllowOroms;
      self->_payloadAllowOroms = v18;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CurrentPassword"), self->_payloadCurrentPassword, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("NewPassword"), self->_payloadNewPassword, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AllowOroms"), self->_payloadAllowOroms, 0, MEMORY[0x24BDBD1C0]);
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMPasscodeSetFirmwarePasswordCommand;
  v4 = -[CEMCommandBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadCurrentPassword, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[NSString copy](self->_payloadNewPassword, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowOroms, "copy");
  v10 = (void *)v4[9];
  v4[9] = v9;

  return v4;
}

- (NSString)payloadCurrentPassword
{
  return self->_payloadCurrentPassword;
}

- (void)setPayloadCurrentPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadNewPassword
{
  return self->_payloadNewPassword;
}

- (void)setPayloadNewPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadAllowOroms
{
  return self->_payloadAllowOroms;
}

- (void)setPayloadAllowOroms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowOroms, 0);
  objc_storeStrong((id *)&self->_payloadNewPassword, 0);
  objc_storeStrong((id *)&self->_payloadCurrentPassword, 0);
}

@end
