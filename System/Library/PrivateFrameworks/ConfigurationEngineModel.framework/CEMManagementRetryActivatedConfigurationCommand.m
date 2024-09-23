@implementation CEMManagementRetryActivatedConfigurationCommand

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Commands");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.command.management.retry");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ActivationIdentifier");
  v6[1] = CFSTR("ConfigurationIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)executionLevel
{
  return 2;
}

+ (id)buildWithIdentifier:(id)a3 withActivationIdentifier:(id)a4 withConfigurationIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setCommandType:", CFSTR("com.apple.command.management.retry"));
  if (v7)
  {
    objc_msgSend(v10, "setCommandIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCommandIdentifier:", v12);

  }
  objc_msgSend(v10, "setPayloadActivationIdentifier:", v9);

  objc_msgSend(v10, "setPayloadConfigurationIdentifier:", v8);
  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withActivationIdentifier:(id)a4 withConfigurationIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setCommandType:", CFSTR("com.apple.command.management.retry"));
  if (v7)
  {
    objc_msgSend(v10, "setCommandIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCommandIdentifier:", v12);

  }
  objc_msgSend(v10, "setPayloadActivationIdentifier:", v9);

  objc_msgSend(v10, "setPayloadConfigurationIdentifier:", v8);
  return v10;
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
  NSString *payloadActivationIdentifier;
  NSString *v16;
  NSString *payloadConfigurationIdentifier;
  id v19;
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMManagementRetryActivatedConfigurationCommand allowedPayloadKeys](CEMManagementRetryActivatedConfigurationCommand, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v20 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ActivationIdentifier"), 1, 0, &v20);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  payloadActivationIdentifier = self->_payloadActivationIdentifier;
  self->_payloadActivationIdentifier = v13;

  if (!v14)
  {
    v19 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ConfigurationIdentifier"), 1, 0, &v19);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    payloadConfigurationIdentifier = self->_payloadConfigurationIdentifier;
    self->_payloadConfigurationIdentifier = v16;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ActivationIdentifier"), self->_payloadActivationIdentifier, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ConfigurationIdentifier"), self->_payloadConfigurationIdentifier, 1, 0);
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CEMManagementRetryActivatedConfigurationCommand;
  v4 = -[CEMCommandBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadActivationIdentifier, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[NSString copy](self->_payloadConfigurationIdentifier, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  return v4;
}

- (NSString)payloadActivationIdentifier
{
  return self->_payloadActivationIdentifier;
}

- (void)setPayloadActivationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadConfigurationIdentifier
{
  return self->_payloadConfigurationIdentifier;
}

- (void)setPayloadConfigurationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadActivationIdentifier, 0);
}

@end
