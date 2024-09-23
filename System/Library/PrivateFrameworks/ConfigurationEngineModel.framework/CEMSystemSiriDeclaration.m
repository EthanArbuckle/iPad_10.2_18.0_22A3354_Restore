@implementation CEMSystemSiriDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.siri");
}

+ (id)profileType
{
  return &stru_24C63AAC0;
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowAssistant");
  v6[1] = CFSTR("allowDictation");
  v6[2] = CFSTR("allowAssistantUserGeneratedContent");
  v6[3] = CFSTR("forceAssistantProfanityFilter");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowAssistant");
  v6[1] = CFSTR("allowDictation");
  v6[2] = CFSTR("allowAssistantUserGeneratedContent");
  v6[3] = CFSTR("forceAssistantProfanityFilter");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

+ (id)buildWithIdentifier:(id)a3 withAllowAssistant:(id)a4 withAllowDictation:(id)a5 withAllowAssistantUserGeneratedContent:(id)a6 withForceAssistantProfanityFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.system.siri"));
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
  v19 = (void *)MEMORY[0x24BDBD1C8];
  if (v15)
    v20 = v15;
  else
    v20 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v16, "setPayloadAllowAssistant:", v20);

  if (v14)
    v21 = v14;
  else
    v21 = v19;
  objc_msgSend(v16, "setPayloadAllowDictation:", v21);

  if (v13)
    v22 = v13;
  else
    v22 = v19;
  objc_msgSend(v16, "setPayloadAllowAssistantUserGeneratedContent:", v22);

  if (v12)
    v23 = v12;
  else
    v23 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v16, "setPayloadForceAssistantProfanityFilter:", v23);

  objc_msgSend(v16, "updateServerHash");
  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.siri"));
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
  NSNumber *v13;
  id v14;
  NSNumber *payloadAllowAssistant;
  NSNumber *v16;
  NSNumber *payloadAllowDictation;
  NSNumber *v18;
  NSNumber *payloadAllowAssistantUserGeneratedContent;
  NSNumber *v20;
  NSNumber *payloadForceAssistantProfanityFilter;
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

  +[CEMSystemSiriDeclaration allowedPayloadKeys](CEMSystemSiriDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAssistant"), 0, MEMORY[0x24BDBD1C8], &v26);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadAllowAssistant = self->_payloadAllowAssistant;
  self->_payloadAllowAssistant = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowDictation"), 0, MEMORY[0x24BDBD1C8], &v25);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadAllowDictation = self->_payloadAllowDictation;
    self->_payloadAllowDictation = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAssistantUserGeneratedContent"), 0, MEMORY[0x24BDBD1C8], &v24);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadAllowAssistantUserGeneratedContent = self->_payloadAllowAssistantUserGeneratedContent;
      self->_payloadAllowAssistantUserGeneratedContent = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("forceAssistantProfanityFilter"), 0, MEMORY[0x24BDBD1C0], &v23);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadForceAssistantProfanityFilter = self->_payloadForceAssistantProfanityFilter;
        self->_payloadForceAssistantProfanityFilter = v20;

      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAssistant"), self->_payloadAllowAssistant, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowDictation"), self->_payloadAllowDictation, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAssistantUserGeneratedContent"), self->_payloadAllowAssistantUserGeneratedContent, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("forceAssistantProfanityFilter"), self->_payloadForceAssistantProfanityFilter, 0, MEMORY[0x24BDBD1C0]);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
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
  v14.super_class = (Class)CEMSystemSiriDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowAssistant, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowDictation, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowAssistantUserGeneratedContent, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadForceAssistantProfanityFilter, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSNumber)payloadAllowAssistant
{
  return self->_payloadAllowAssistant;
}

- (void)setPayloadAllowAssistant:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowDictation
{
  return self->_payloadAllowDictation;
}

- (void)setPayloadAllowDictation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowAssistantUserGeneratedContent
{
  return self->_payloadAllowAssistantUserGeneratedContent;
}

- (void)setPayloadAllowAssistantUserGeneratedContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadForceAssistantProfanityFilter
{
  return self->_payloadForceAssistantProfanityFilter;
}

- (void)setPayloadForceAssistantProfanityFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadForceAssistantProfanityFilter, 0);
  objc_storeStrong((id *)&self->_payloadAllowAssistantUserGeneratedContent, 0);
  objc_storeStrong((id *)&self->_payloadAllowDictation, 0);
  objc_storeStrong((id *)&self->_payloadAllowAssistant, 0);
}

@end
