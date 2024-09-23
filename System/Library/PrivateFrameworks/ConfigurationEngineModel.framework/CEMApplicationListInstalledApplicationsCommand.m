@implementation CEMApplicationListInstalledApplicationsCommand

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Commands");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.command.application.list");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("BundleIdentifiers");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
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
  return 2;
}

+ (id)buildWithIdentifier:(id)a3 withBundleIdentifiers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCommandType:", CFSTR("com.apple.command.application.list"));
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
  objc_msgSend(v7, "setPayloadBundleIdentifiers:", v6);

  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCommandType:", CFSTR("com.apple.command.application.list"));
  if (v3)
  {
    objc_msgSend(v4, "setCommandIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCommandIdentifier:", v6);

  }
  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSArray *v13;
  id v14;
  NSArray *payloadBundleIdentifiers;
  id v17;

  v6 = (void *)MEMORY[0x24BDBCEF0];
  v7 = a3;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationListInstalledApplicationsCommand allowedPayloadKeys](CEMApplicationListInstalledApplicationsCommand, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v17 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v7, CFSTR("BundleIdentifiers"), &__block_literal_global_6, 0, 0, &v17);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v14 = v17;
  payloadBundleIdentifiers = self->_payloadBundleIdentifiers;
  self->_payloadBundleIdentifiers = v13;

  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __68__CEMApplicationListInstalledApplicationsCommand_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("BundleIdentifiers"), self->_payloadBundleIdentifiers, &__block_literal_global_15, 0, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

id __85__CEMApplicationListInstalledApplicationsCommand_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CEMApplicationListInstalledApplicationsCommand;
  v4 = -[CEMCommandBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadBundleIdentifiers, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  return v4;
}

- (NSArray)payloadBundleIdentifiers
{
  return self->_payloadBundleIdentifiers;
}

- (void)setPayloadBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadBundleIdentifiers, 0);
}

uint64_t __73__CEMApplicationListInstalledApplicationsCommand_Status_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
}

@end
