@implementation CEMAccountGoogleDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.account.google-oauth");
}

+ (id)profileType
{
  return CFSTR("com.apple.google-oauth");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("AccountDescription");
  v6[1] = CFSTR("AccountName");
  v6[2] = CFSTR("EmailAddress");
  v6[3] = CFSTR("CommunicationServiceRules");
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
  return 1;
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

+ (id)buildWithIdentifier:(id)a3 withAccountDescription:(id)a4 withAccountName:(id)a5 withEmailAddress:(id)a6 withCommunicationServiceRules:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.account.google-oauth"));
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
  objc_msgSend(v16, "setPayloadAccountDescription:", v15);

  objc_msgSend(v16, "setPayloadAccountName:", v14);
  objc_msgSend(v16, "setPayloadEmailAddress:", v13);

  objc_msgSend(v16, "setPayloadCommunicationServiceRules:", v12);
  objc_msgSend(v16, "updateServerHash");

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEmailAddress:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.account.google-oauth"));
  if (v5)
  {
    objc_msgSend(v7, "setDeclarationIdentifier:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeclarationIdentifier:", v9);

  }
  objc_msgSend(v7, "setPayloadEmailAddress:", v6);

  objc_msgSend(v7, "updateServerHash");
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
  NSString *payloadAccountDescription;
  NSString *v16;
  NSString *payloadAccountName;
  NSString *v18;
  NSString *payloadEmailAddress;
  CEMAccountGoogleDeclaration_CommunicationServiceRules *v20;
  CEMAccountGoogleDeclaration_CommunicationServiceRules *payloadCommunicationServiceRules;
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

  +[CEMAccountGoogleDeclaration allowedPayloadKeys](CEMAccountGoogleDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AccountDescription"), 0, 0, &v26);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadAccountDescription = self->_payloadAccountDescription;
  self->_payloadAccountDescription = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AccountName"), 0, 0, &v25);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadAccountName = self->_payloadAccountName;
    self->_payloadAccountName = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EmailAddress"), 1, 0, &v24);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadEmailAddress = self->_payloadEmailAddress;
      self->_payloadEmailAddress = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("CommunicationServiceRules"), objc_opt_class(), 0, 0, &v23);
        v20 = (CEMAccountGoogleDeclaration_CommunicationServiceRules *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
        self->_payloadCommunicationServiceRules = v20;

      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  CEMAccountGoogleDeclaration_CommunicationServiceRules *payloadCommunicationServiceRules;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AccountDescription"), self->_payloadAccountDescription, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AccountName"), self->_payloadAccountName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EmailAddress"), self->_payloadEmailAddress, 1, 0);
  payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__CEMAccountGoogleDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_24C638560;
  v11 = v4;
  v7 = v4;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("CommunicationServiceRules"), payloadCommunicationServiceRules, v10, 0, 0);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

uint64_t __66__CEMAccountGoogleDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMAccountGoogleDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadAccountDescription, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadAccountName, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadEmailAddress, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[CEMAccountGoogleDeclaration_CommunicationServiceRules copy](self->_payloadCommunicationServiceRules, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSString)payloadAccountDescription
{
  return self->_payloadAccountDescription;
}

- (void)setPayloadAccountDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadAccountName
{
  return self->_payloadAccountName;
}

- (void)setPayloadAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadEmailAddress
{
  return self->_payloadEmailAddress;
}

- (void)setPayloadEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CEMAccountGoogleDeclaration_CommunicationServiceRules)payloadCommunicationServiceRules
{
  return self->_payloadCommunicationServiceRules;
}

- (void)setPayloadCommunicationServiceRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCommunicationServiceRules, 0);
  objc_storeStrong((id *)&self->_payloadEmailAddress, 0);
  objc_storeStrong((id *)&self->_payloadAccountName, 0);
  objc_storeStrong((id *)&self->_payloadAccountDescription, 0);
}

uint64_t __92__CEMAccountGoogleDeclaration_CommunicationServiceRules_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

@end
