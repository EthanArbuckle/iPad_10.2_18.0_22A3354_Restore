@implementation CEMAccountCalDAVDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.account.caldav");
}

+ (id)profileType
{
  return CFSTR("com.apple.caldav.account");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("CalDAVAccountDescription");
  v6[1] = CFSTR("CalDAVHostName");
  v6[2] = CFSTR("CalDAVPrincipalURL");
  v6[3] = CFSTR("CalDAVUseSSL");
  v6[4] = CFSTR("CalDAVPort");
  v6[5] = CFSTR("CalDAVCredentials");
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
  -[CEMAccountCalDAVDeclaration payloadCalDAVCredentials](self, "payloadCalDAVCredentials");
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

+ (id)buildWithIdentifier:(id)a3 withCalDAVAccountDescription:(id)a4 withCalDAVHostName:(id)a5 withCalDAVPrincipalURL:(id)a6 withCalDAVUseSSL:(id)a7 withCalDAVPort:(id)a8 withCalDAVCredentials:(id)a9
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
  void *v25;

  v14 = a3;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setDeclarationType:", CFSTR("com.apple.configuration.account.caldav"));
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
  objc_msgSend(v21, "setPayloadCalDAVAccountDescription:", v20);

  objc_msgSend(v21, "setPayloadCalDAVHostName:", v19);
  objc_msgSend(v21, "setPayloadCalDAVPrincipalURL:", v18);

  if (v17)
    v24 = v17;
  else
    v24 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v21, "setPayloadCalDAVUseSSL:", v24);

  if (v16)
    v25 = v16;
  else
    v25 = &unk_24C69CC08;
  objc_msgSend(v21, "setPayloadCalDAVPort:", v25);

  objc_msgSend(v21, "setPayloadCalDAVCredentials:", v15);
  objc_msgSend(v21, "updateServerHash");

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withCalDAVHostName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.account.caldav"));
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
  objc_msgSend(v7, "setPayloadCalDAVHostName:", v6);

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
  NSString *payloadCalDAVAccountDescription;
  NSString *v16;
  NSString *payloadCalDAVHostName;
  NSString *v18;
  NSString *payloadCalDAVPrincipalURL;
  NSNumber *v20;
  NSNumber *payloadCalDAVUseSSL;
  NSNumber *v22;
  NSNumber *payloadCalDAVPort;
  NSString *v24;
  NSString *payloadCalDAVCredentials;
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

  +[CEMAccountCalDAVDeclaration allowedPayloadKeys](CEMAccountCalDAVDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v32 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CalDAVAccountDescription"), 0, 0, &v32);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  payloadCalDAVAccountDescription = self->_payloadCalDAVAccountDescription;
  self->_payloadCalDAVAccountDescription = v13;

  if (!v14)
  {
    v31 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CalDAVHostName"), 1, 0, &v31);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    payloadCalDAVHostName = self->_payloadCalDAVHostName;
    self->_payloadCalDAVHostName = v16;

    if (!v14)
    {
      v30 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CalDAVPrincipalURL"), 0, 0, &v30);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      payloadCalDAVPrincipalURL = self->_payloadCalDAVPrincipalURL;
      self->_payloadCalDAVPrincipalURL = v18;

      if (!v14)
      {
        v29 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CalDAVUseSSL"), 0, MEMORY[0x24BDBD1C8], &v29);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        payloadCalDAVUseSSL = self->_payloadCalDAVUseSSL;
        self->_payloadCalDAVUseSSL = v20;

        if (!v14)
        {
          v28 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CalDAVPort"), 0, &unk_24C69CC08, &v28);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          payloadCalDAVPort = self->_payloadCalDAVPort;
          self->_payloadCalDAVPort = v22;

          if (!v14)
          {
            v27 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CalDAVCredentials"), 0, 0, &v27);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v27;
            payloadCalDAVCredentials = self->_payloadCalDAVCredentials;
            self->_payloadCalDAVCredentials = v24;

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
  NSString *payloadCalDAVCredentials;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CalDAVAccountDescription"), self->_payloadCalDAVAccountDescription, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CalDAVHostName"), self->_payloadCalDAVHostName, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CalDAVPrincipalURL"), self->_payloadCalDAVPrincipalURL, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CalDAVUseSSL"), self->_payloadCalDAVUseSSL, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CalDAVPort"), self->_payloadCalDAVPort, 0, &unk_24C69CC08);
  payloadCalDAVCredentials = self->_payloadCalDAVCredentials;
  if (payloadCalDAVCredentials)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", self->_payloadCalDAVCredentials);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("CalDAVCredentials"), payloadCalDAVCredentials, v7, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("CalDAVCredentials"), 0, 0, &stru_24C63AAC0);
  }
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
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
  v18.super_class = (Class)CEMAccountCalDAVDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadCalDAVAccountDescription, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadCalDAVHostName, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadCalDAVPrincipalURL, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadCalDAVUseSSL, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadCalDAVPort, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadCalDAVCredentials, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSString)payloadCalDAVAccountDescription
{
  return self->_payloadCalDAVAccountDescription;
}

- (void)setPayloadCalDAVAccountDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadCalDAVHostName
{
  return self->_payloadCalDAVHostName;
}

- (void)setPayloadCalDAVHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadCalDAVPrincipalURL
{
  return self->_payloadCalDAVPrincipalURL;
}

- (void)setPayloadCalDAVPrincipalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadCalDAVUseSSL
{
  return self->_payloadCalDAVUseSSL;
}

- (void)setPayloadCalDAVUseSSL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadCalDAVPort
{
  return self->_payloadCalDAVPort;
}

- (void)setPayloadCalDAVPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadCalDAVCredentials
{
  return self->_payloadCalDAVCredentials;
}

- (void)setPayloadCalDAVCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCalDAVCredentials, 0);
  objc_storeStrong((id *)&self->_payloadCalDAVPort, 0);
  objc_storeStrong((id *)&self->_payloadCalDAVUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadCalDAVPrincipalURL, 0);
  objc_storeStrong((id *)&self->_payloadCalDAVHostName, 0);
  objc_storeStrong((id *)&self->_payloadCalDAVAccountDescription, 0);
}

@end
