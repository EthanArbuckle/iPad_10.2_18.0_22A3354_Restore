@implementation CEMSystemDashboardDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.dashboard");
}

+ (id)profileType
{
  return CFSTR("com.apple.dashboard");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("whiteListEnabled");
  v6[1] = CFSTR("WhiteList");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withWhiteListEnabled:(id)a4 withWhiteList:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.system.dashboard"));
  if (v7)
  {
    objc_msgSend(v10, "setDeclarationIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeclarationIdentifier:", v12);

  }
  objc_msgSend(v10, "setPayloadWhiteListEnabled:", v9);

  objc_msgSend(v10, "setPayloadWhiteList:", v8);
  objc_msgSend(v10, "updateServerHash");

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withWhiteListEnabled:(id)a4 withWhiteList:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.system.dashboard"));
  if (v7)
  {
    objc_msgSend(v10, "setDeclarationIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeclarationIdentifier:", v12);

  }
  objc_msgSend(v10, "setPayloadWhiteListEnabled:", v9);

  objc_msgSend(v10, "setPayloadWhiteList:", v8);
  objc_msgSend(v10, "updateServerHash");

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
  NSNumber *v13;
  id v14;
  NSNumber *payloadWhiteListEnabled;
  NSArray *v16;
  NSArray *payloadWhiteList;
  id v19;
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemDashboardDeclaration allowedPayloadKeys](CEMSystemDashboardDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v20 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("whiteListEnabled"), 1, 0, &v20);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  payloadWhiteListEnabled = self->_payloadWhiteListEnabled;
  self->_payloadWhiteListEnabled = v13;

  if (!v14)
  {
    v19 = 0;
    -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("WhiteList"), objc_opt_class(), 0, 1, 0, &v19);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    payloadWhiteList = self->_payloadWhiteList;
    self->_payloadWhiteList = v16;

  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  NSArray *payloadWhiteList;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("whiteListEnabled"), self->_payloadWhiteListEnabled, 1, 0);
  payloadWhiteList = self->_payloadWhiteList;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__CEMSystemDashboardDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_24C63A258;
  v11 = v4;
  v7 = v4;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("WhiteList"), payloadWhiteList, v10, 1, 0);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

uint64_t __68__CEMSystemDashboardDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
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
  v10.super_class = (Class)CEMSystemDashboardDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadWhiteListEnabled, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSArray copy](self->_payloadWhiteList, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSNumber)payloadWhiteListEnabled
{
  return self->_payloadWhiteListEnabled;
}

- (void)setPayloadWhiteListEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)payloadWhiteList
{
  return self->_payloadWhiteList;
}

- (void)setPayloadWhiteList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadWhiteList, 0);
  objc_storeStrong((id *)&self->_payloadWhiteListEnabled, 0);
}

@end
