@implementation CEMAccountCardDAVDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.account.carddav");
}

+ (id)profileType
{
  return CFSTR("com.apple.carddav.account");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("CardDAVAccountDescription");
  v6[1] = CFSTR("CardDAVHostName");
  v6[2] = CFSTR("CardDAVPrincipalURL");
  v6[3] = CFSTR("CardDAVUseSSL");
  v6[4] = CFSTR("CardDAVPort");
  v6[5] = CFSTR("CommunicationServiceRules");
  v6[6] = CFSTR("CardDAVCredentials");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
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
  -[CEMAccountCardDAVDeclaration payloadCardDAVCredentials](self, "payloadCardDAVCredentials");
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

+ (id)buildWithIdentifier:(id)a3 withCardDAVAccountDescription:(id)a4 withCardDAVHostName:(id)a5 withCardDAVPrincipalURL:(id)a6 withCardDAVUseSSL:(id)a7 withCardDAVPort:(id)a8 withCommunicationServiceRules:(id)a9 withCardDAVCredentials:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v28;

  v15 = a3;
  v28 = a10;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setDeclarationType:", CFSTR("com.apple.configuration.account.carddav"));
  if (v15)
  {
    objc_msgSend(v22, "setDeclarationIdentifier:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDeclarationIdentifier:", v24);

  }
  objc_msgSend(v22, "setPayloadCardDAVAccountDescription:", v21);

  objc_msgSend(v22, "setPayloadCardDAVHostName:", v20);
  objc_msgSend(v22, "setPayloadCardDAVPrincipalURL:", v19);

  if (v18)
    v25 = v18;
  else
    v25 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v22, "setPayloadCardDAVUseSSL:", v25);

  if (v17)
    v26 = v17;
  else
    v26 = &unk_24C69CC20;
  objc_msgSend(v22, "setPayloadCardDAVPort:", v26);

  objc_msgSend(v22, "setPayloadCommunicationServiceRules:", v16);
  objc_msgSend(v22, "setPayloadCardDAVCredentials:", v28);

  objc_msgSend(v22, "updateServerHash");
  return v22;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withCardDAVHostName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.account.carddav"));
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
  objc_msgSend(v7, "setPayloadCardDAVHostName:", v6);

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
  NSString *payloadCardDAVAccountDescription;
  NSString *v16;
  NSString *payloadCardDAVHostName;
  NSString *v18;
  NSString *payloadCardDAVPrincipalURL;
  NSNumber *v20;
  NSNumber *payloadCardDAVUseSSL;
  NSNumber *v22;
  NSNumber *payloadCardDAVPort;
  CEMAccountCardDAVDeclaration_CommunicationServiceRules *v24;
  CEMAccountCardDAVDeclaration_CommunicationServiceRules *payloadCommunicationServiceRules;
  NSString *v26;
  NSString *payloadCardDAVCredentials;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMAccountCardDAVDeclaration allowedPayloadKeys](CEMAccountCardDAVDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v35 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CardDAVAccountDescription"), 0, 0, &v35);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v35;
  payloadCardDAVAccountDescription = self->_payloadCardDAVAccountDescription;
  self->_payloadCardDAVAccountDescription = v13;

  if (!v14)
  {
    v34 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CardDAVHostName"), 1, 0, &v34);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v34;
    payloadCardDAVHostName = self->_payloadCardDAVHostName;
    self->_payloadCardDAVHostName = v16;

    if (!v14)
    {
      v33 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CardDAVPrincipalURL"), 0, 0, &v33);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v33;
      payloadCardDAVPrincipalURL = self->_payloadCardDAVPrincipalURL;
      self->_payloadCardDAVPrincipalURL = v18;

      if (!v14)
      {
        v32 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CardDAVUseSSL"), 0, MEMORY[0x24BDBD1C8], &v32);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v32;
        payloadCardDAVUseSSL = self->_payloadCardDAVUseSSL;
        self->_payloadCardDAVUseSSL = v20;

        if (!v14)
        {
          v31 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CardDAVPort"), 0, &unk_24C69CC20, &v31);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v31;
          payloadCardDAVPort = self->_payloadCardDAVPort;
          self->_payloadCardDAVPort = v22;

          if (!v14)
          {
            v30 = 0;
            -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("CommunicationServiceRules"), objc_opt_class(), 0, 0, &v30);
            v24 = (CEMAccountCardDAVDeclaration_CommunicationServiceRules *)objc_claimAutoreleasedReturnValue();
            v14 = v30;
            payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
            self->_payloadCommunicationServiceRules = v24;

            if (!v14)
            {
              v29 = 0;
              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CardDAVCredentials"), 0, 0, &v29);
              v26 = (NSString *)objc_claimAutoreleasedReturnValue();
              v14 = v29;
              payloadCardDAVCredentials = self->_payloadCardDAVCredentials;
              self->_payloadCardDAVCredentials = v26;

            }
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
  CEMAccountCardDAVDeclaration_CommunicationServiceRules *payloadCommunicationServiceRules;
  id v7;
  NSString *payloadCardDAVCredentials;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CardDAVAccountDescription"), self->_payloadCardDAVAccountDescription, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CardDAVHostName"), self->_payloadCardDAVHostName, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CardDAVPrincipalURL"), self->_payloadCardDAVPrincipalURL, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CardDAVUseSSL"), self->_payloadCardDAVUseSSL, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CardDAVPort"), self->_payloadCardDAVPort, 0, &unk_24C69CC20);
  payloadCommunicationServiceRules = self->_payloadCommunicationServiceRules;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __67__CEMAccountCardDAVDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v15 = &unk_24C638560;
  v7 = v4;
  v16 = v7;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("CommunicationServiceRules"), payloadCommunicationServiceRules, &v12, 0, 0);
  payloadCardDAVCredentials = self->_payloadCardDAVCredentials;
  if (payloadCardDAVCredentials)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", self->_payloadCardDAVCredentials);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("CardDAVCredentials"), payloadCardDAVCredentials, v9, &stru_24C63AAC0, v12, v13, v14, v15);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("CardDAVCredentials"), 0, 0, &stru_24C63AAC0, v12, v13, v14, v15);
  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

uint64_t __67__CEMAccountCardDAVDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CEMAccountCardDAVDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v20, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadCardDAVAccountDescription, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadCardDAVHostName, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadCardDAVPrincipalURL, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadCardDAVUseSSL, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadCardDAVPort, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[CEMAccountCardDAVDeclaration_CommunicationServiceRules copy](self->_payloadCommunicationServiceRules, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSString copy](self->_payloadCardDAVCredentials, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  return v4;
}

- (NSString)payloadCardDAVAccountDescription
{
  return self->_payloadCardDAVAccountDescription;
}

- (void)setPayloadCardDAVAccountDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadCardDAVHostName
{
  return self->_payloadCardDAVHostName;
}

- (void)setPayloadCardDAVHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadCardDAVPrincipalURL
{
  return self->_payloadCardDAVPrincipalURL;
}

- (void)setPayloadCardDAVPrincipalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadCardDAVUseSSL
{
  return self->_payloadCardDAVUseSSL;
}

- (void)setPayloadCardDAVUseSSL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadCardDAVPort
{
  return self->_payloadCardDAVPort;
}

- (void)setPayloadCardDAVPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CEMAccountCardDAVDeclaration_CommunicationServiceRules)payloadCommunicationServiceRules
{
  return self->_payloadCommunicationServiceRules;
}

- (void)setPayloadCommunicationServiceRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)payloadCardDAVCredentials
{
  return self->_payloadCardDAVCredentials;
}

- (void)setPayloadCardDAVCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCardDAVCredentials, 0);
  objc_storeStrong((id *)&self->_payloadCommunicationServiceRules, 0);
  objc_storeStrong((id *)&self->_payloadCardDAVPort, 0);
  objc_storeStrong((id *)&self->_payloadCardDAVUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadCardDAVPrincipalURL, 0);
  objc_storeStrong((id *)&self->_payloadCardDAVHostName, 0);
  objc_storeStrong((id *)&self->_payloadCardDAVAccountDescription, 0);
}

uint64_t __93__CEMAccountCardDAVDeclaration_CommunicationServiceRules_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

@end
