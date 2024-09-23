@implementation CEMAccountLDAPDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.account.ldap");
}

+ (id)profileType
{
  return CFSTR("com.apple.ldap.account");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("LDAPAccountDescription");
  v6[1] = CFSTR("LDAPAccountHostName");
  v6[2] = CFSTR("LDAPAccountUseSSL");
  v6[3] = CFSTR("LDAPSearchSettings");
  v6[4] = CFSTR("CommunicationServiceRules");
  v6[5] = CFSTR("LDAPCredentials");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMAccountLDAPDeclaration payloadLDAPCredentials](self, "payloadLDAPCredentials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CEMAssetReference referenceForIdentifier:assetschematype:](CEMAssetReference, "referenceForIdentifier:assetschematype:", v4, CFSTR("credential"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withLDAPAccountDescription:(id)a4 withLDAPAccountHostName:(id)a5 withLDAPAccountUseSSL:(id)a6 withLDAPSearchSettings:(id)a7 withCommunicationServiceRules:(id)a8 withLDAPCredentials:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v14 = a3;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setDeclarationType:", CFSTR("com.apple.configuration.account.ldap"));
  if (v14)
  {
    objc_msgSend(v21, "setDeclarationIdentifier:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDeclarationIdentifier:", v23);

  }
  objc_msgSend(v21, "setPayloadLDAPAccountDescription:", v20);

  objc_msgSend(v21, "setPayloadLDAPAccountHostName:", v19);
  if (v18)
    v24 = v18;
  else
    v24 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v21, "setPayloadLDAPAccountUseSSL:", v24);

  objc_msgSend(v21, "setPayloadLDAPSearchSettings:", v17);
  objc_msgSend(v21, "setPayloadCommunicationServiceRules:", v16);

  objc_msgSend(v21, "setPayloadLDAPCredentials:", v15);
  objc_msgSend(v21, "updateServerHash");

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withLDAPAccountHostName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.account.ldap"));
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
  objc_msgSend(v7, "setPayloadLDAPAccountHostName:", v6);

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
  NSString *payloadLDAPAccountDescription;
  NSString *v16;
  NSString *payloadLDAPAccountHostName;
  NSNumber *v18;
  NSNumber *payloadLDAPAccountUseSSL;
  NSArray *v20;
  NSArray *payloadLDAPSearchSettings;
  CEMAccountLDAPDeclaration_CommunicationServiceRules *v22;
  CEMAccountLDAPDeclaration_CommunicationServiceRules *payloadCommunicationServiceRules;
  NSString *v24;
  NSString *payloadLDAPCredentials;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMAccountLDAPDeclaration allowedPayloadKeys](CEMAccountLDAPDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v32 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LDAPAccountDescription"), 0, 0, &v32);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  payloadLDAPAccountDescription = self->_payloadLDAPAccountDescription;
  self->_payloadLDAPAccountDescription = v13;

  if (!v14)
  {
    v31 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LDAPAccountHostName"), 1, 0, &v31);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    payloadLDAPAccountHostName = self->_payloadLDAPAccountHostName;
    self->_payloadLDAPAccountHostName = v16;

    if (!v14)
    {
      v30 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LDAPAccountUseSSL"), 0, MEMORY[0x24BDBD1C8], &v30);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      payloadLDAPAccountUseSSL = self->_payloadLDAPAccountUseSSL;
      self->_payloadLDAPAccountUseSSL = v18;

      if (!v14)
      {
        v29 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("LDAPSearchSettings"), objc_opt_class(), 0, 0, 0, &v29);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        payloadLDAPSearchSettings = self->_payloadLDAPSearchSettings;
        self->_payloadLDAPSearchSettings = v20;

        if (!v14)
        {
          v28 = 0;
          -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("CommunicationServiceRules"), objc_opt_class(), 0, 0, &v28);
          v22 = (CEMAccountLDAPDeclaration_CommunicationServiceRules *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
          self->_payloadCommunicationServiceRules = v22;

          if (!v14)
          {
            v27 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LDAPCredentials"), 0, 0, &v27);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v27;
            payloadLDAPCredentials = self->_payloadLDAPCredentials;
            self->_payloadLDAPCredentials = v24;

          }
        }
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
  NSArray *payloadLDAPSearchSettings;
  uint64_t v7;
  id v8;
  CEMAccountLDAPDeclaration_CommunicationServiceRules *payloadCommunicationServiceRules;
  id v10;
  NSString *payloadLDAPCredentials;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("LDAPAccountDescription"), self->_payloadLDAPAccountDescription, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("LDAPAccountHostName"), self->_payloadLDAPAccountHostName, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("LDAPAccountUseSSL"), self->_payloadLDAPAccountUseSSL, 0, MEMORY[0x24BDBD1C8]);
  payloadLDAPSearchSettings = self->_payloadLDAPSearchSettings;
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __64__CEMAccountLDAPDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v17[3] = &unk_24C638588;
  v8 = v4;
  v18 = v8;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("LDAPSearchSettings"), payloadLDAPSearchSettings, v17, 0, 0);
  payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __64__CEMAccountLDAPDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v15[3] = &unk_24C638560;
  v10 = v8;
  v16 = v10;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("CommunicationServiceRules"), payloadCommunicationServiceRules, v15, 0, 0);
  payloadLDAPCredentials = self->_payloadLDAPCredentials;
  if (payloadLDAPCredentials)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", self->_payloadLDAPCredentials);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("LDAPCredentials"), payloadLDAPCredentials, v12, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("LDAPCredentials"), 0, 0, &stru_24C63AAC0);
  }
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
}

uint64_t __64__CEMAccountLDAPDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__CEMAccountLDAPDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CEMAccountLDAPDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadLDAPAccountDescription, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadLDAPAccountHostName, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadLDAPAccountUseSSL, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSArray copy](self->_payloadLDAPSearchSettings, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[CEMAccountLDAPDeclaration_CommunicationServiceRules copy](self->_payloadCommunicationServiceRules, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadLDAPCredentials, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSString)payloadLDAPAccountDescription
{
  return self->_payloadLDAPAccountDescription;
}

- (void)setPayloadLDAPAccountDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadLDAPAccountHostName
{
  return self->_payloadLDAPAccountHostName;
}

- (void)setPayloadLDAPAccountHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadLDAPAccountUseSSL
{
  return self->_payloadLDAPAccountUseSSL;
}

- (void)setPayloadLDAPAccountUseSSL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)payloadLDAPSearchSettings
{
  return self->_payloadLDAPSearchSettings;
}

- (void)setPayloadLDAPSearchSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CEMAccountLDAPDeclaration_CommunicationServiceRules)payloadCommunicationServiceRules
{
  return self->_payloadCommunicationServiceRules;
}

- (void)setPayloadCommunicationServiceRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadLDAPCredentials
{
  return self->_payloadLDAPCredentials;
}

- (void)setPayloadLDAPCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLDAPCredentials, 0);
  objc_storeStrong((id *)&self->_payloadCommunicationServiceRules, 0);
  objc_storeStrong((id *)&self->_payloadLDAPSearchSettings, 0);
  objc_storeStrong((id *)&self->_payloadLDAPAccountUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadLDAPAccountHostName, 0);
  objc_storeStrong((id *)&self->_payloadLDAPAccountDescription, 0);
}

uint64_t __90__CEMAccountLDAPDeclaration_CommunicationServiceRules_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

@end
