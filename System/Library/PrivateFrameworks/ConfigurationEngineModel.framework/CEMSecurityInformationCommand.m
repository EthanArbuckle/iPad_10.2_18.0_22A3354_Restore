@implementation CEMSecurityInformationCommand

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Commands");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.command.security.information");
}

+ (NSSet)allowedPayloadKeys
{
  return (NSSet *)(id)objc_opt_new();
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)executionLevel
{
  return 0;
}

+ (id)buildWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCommandType:", CFSTR("com.apple.command.security.information"));
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

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCommandType:", CFSTR("com.apple.command.security.information"));
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
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  NSSet *unknownPayloadKeys;

  v5 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(a3, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSecurityInformationCommand allowedPayloadKeys](CEMSecurityInformationCommand, "allowedPayloadKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  v9 = (NSSet *)objc_msgSend(v7, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v9;

  return 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CEMSecurityInformationCommand;
  return -[CEMCommandBase copyWithZone:](&v4, sel_copyWithZone_, a3);
}

uint64_t __56__CEMSecurityInformationCommand_Status_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
}

uint64_t __68__CEMSecurityInformationCommand_StatusSecurityInfo_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
}

uint64_t __68__CEMSecurityInformationCommand_StatusSecurityInfo_serializePayload__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
}

uint64_t __84__CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
}

@end
