@implementation CEMNetworkDomainsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.network.domains");
}

+ (id)profileType
{
  return CFSTR("com.apple.domains");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("EmailDomains");
  v6[1] = CFSTR("WebDomains");
  v6[2] = CFSTR("SafariPasswordAutoFillDomains");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
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

+ (id)buildWithIdentifier:(id)a3 withEmailDomains:(id)a4 withWebDomains:(id)a5 withSafariPasswordAutoFillDomains:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.network.domains"));
  if (v9)
  {
    objc_msgSend(v13, "setDeclarationIdentifier:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDeclarationIdentifier:", v15);

  }
  objc_msgSend(v13, "setPayloadEmailDomains:", v12);

  objc_msgSend(v13, "setPayloadWebDomains:", v11);
  objc_msgSend(v13, "setPayloadSafariPasswordAutoFillDomains:", v10);

  objc_msgSend(v13, "updateServerHash");
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.network.domains"));
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
  NSArray *v13;
  id v14;
  NSArray *payloadEmailDomains;
  NSArray *v16;
  NSArray *payloadWebDomains;
  NSArray *v18;
  NSArray *payloadSafariPasswordAutoFillDomains;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkDomainsDeclaration allowedPayloadKeys](CEMNetworkDomainsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("EmailDomains"), &__block_literal_global_21, 0, 0, &v23);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadEmailDomains = self->_payloadEmailDomains;
  self->_payloadEmailDomains = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("WebDomains"), &__block_literal_global_17_0, 0, 0, &v22);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadWebDomains = self->_payloadWebDomains;
    self->_payloadWebDomains = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("SafariPasswordAutoFillDomains"), &__block_literal_global_18_0, 0, 0, &v21);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadSafariPasswordAutoFillDomains = self->_payloadSafariPasswordAutoFillDomains;
      self->_payloadSafariPasswordAutoFillDomains = v18;

    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __50__CEMNetworkDomainsDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkDomainsDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__CEMNetworkDomainsDeclaration_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
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
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("EmailDomains"), self->_payloadEmailDomains, &__block_literal_global_21_0, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("WebDomains"), self->_payloadWebDomains, &__block_literal_global_22_0, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("SafariPasswordAutoFillDomains"), self->_payloadSafariPasswordAutoFillDomains, &__block_literal_global_23_0, 0, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

id __67__CEMNetworkDomainsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __67__CEMNetworkDomainsDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __67__CEMNetworkDomainsDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
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
  v12.super_class = (Class)CEMNetworkDomainsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadEmailDomains, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSArray copy](self->_payloadWebDomains, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSArray copy](self->_payloadSafariPasswordAutoFillDomains, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSArray)payloadEmailDomains
{
  return self->_payloadEmailDomains;
}

- (void)setPayloadEmailDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)payloadWebDomains
{
  return self->_payloadWebDomains;
}

- (void)setPayloadWebDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)payloadSafariPasswordAutoFillDomains
{
  return self->_payloadSafariPasswordAutoFillDomains;
}

- (void)setPayloadSafariPasswordAutoFillDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSafariPasswordAutoFillDomains, 0);
  objc_storeStrong((id *)&self->_payloadWebDomains, 0);
  objc_storeStrong((id *)&self->_payloadEmailDomains, 0);
}

@end
