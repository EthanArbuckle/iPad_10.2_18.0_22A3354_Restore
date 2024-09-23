@implementation CEMApplicationUpdateApplicationCommand

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Commands");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.command.application.update");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("BundleIdentifier");
  v6[1] = CFSTR("Immediate");
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

+ (id)buildWithIdentifier:(id)a3 withBundleIdentifier:(id)a4 withImmediate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setCommandType:", CFSTR("com.apple.command.application.update"));
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
  objc_msgSend(v10, "setPayloadBundleIdentifier:", v9);

  if (v8)
    v13 = v8;
  else
    v13 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v10, "setPayloadImmediate:", v13);

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCommandType:", CFSTR("com.apple.command.application.update"));
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
  objc_msgSend(v7, "setPayloadBundleIdentifier:", v6);

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
  NSString *payloadBundleIdentifier;
  NSNumber *v16;
  NSNumber *payloadImmediate;
  id v19;
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationUpdateApplicationCommand allowedPayloadKeys](CEMApplicationUpdateApplicationCommand, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v20 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BundleIdentifier"), 1, 0, &v20);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  payloadBundleIdentifier = self->_payloadBundleIdentifier;
  self->_payloadBundleIdentifier = v13;

  if (!v14)
  {
    v19 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Immediate"), 0, MEMORY[0x24BDBD1C0], &v19);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    payloadImmediate = self->_payloadImmediate;
    self->_payloadImmediate = v16;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("BundleIdentifier"), self->_payloadBundleIdentifier, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Immediate"), self->_payloadImmediate, 0, MEMORY[0x24BDBD1C0]);
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
  v10.super_class = (Class)CEMApplicationUpdateApplicationCommand;
  v4 = -[CEMCommandBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadBundleIdentifier, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[NSNumber copy](self->_payloadImmediate, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  return v4;
}

- (NSString)payloadBundleIdentifier
{
  return self->_payloadBundleIdentifier;
}

- (void)setPayloadBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadImmediate
{
  return self->_payloadImmediate;
}

- (void)setPayloadImmediate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadImmediate, 0);
  objc_storeStrong((id *)&self->_payloadBundleIdentifier, 0);
}

@end
