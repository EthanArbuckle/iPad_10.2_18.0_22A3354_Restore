@implementation CEMApplicationLockDeclaration_App

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Identifier");
  v6[1] = CFSTR("Options");
  v6[2] = CFSTR("UserEnabledOptions");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withOptions:(id)a4 withUserEnabledOptions:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPayloadIdentifier:", v9);

  objc_msgSend(v10, "setPayloadOptions:", v8);
  objc_msgSend(v10, "setPayloadUserEnabledOptions:", v7);

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadIdentifier:", v3);

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
  NSString *v13;
  id v14;
  NSString *payloadIdentifier;
  CEMApplicationLockDeclaration_AppOptions *v16;
  CEMApplicationLockDeclaration_AppOptions *payloadOptions;
  CEMApplicationLockDeclaration_AppUserEnabledOptions *v18;
  CEMApplicationLockDeclaration_AppUserEnabledOptions *payloadUserEnabledOptions;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationLockDeclaration_App allowedPayloadKeys](CEMApplicationLockDeclaration_App, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Identifier"), 1, 0, &v23);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadIdentifier = self->_payloadIdentifier;
  self->_payloadIdentifier = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("Options"), objc_opt_class(), 0, 0, &v22);
    v16 = (CEMApplicationLockDeclaration_AppOptions *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadOptions = self->_payloadOptions;
    self->_payloadOptions = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("UserEnabledOptions"), objc_opt_class(), 0, 0, &v21);
      v18 = (CEMApplicationLockDeclaration_AppUserEnabledOptions *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadUserEnabledOptions = self->_payloadUserEnabledOptions;
      self->_payloadUserEnabledOptions = v18;

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
  NSString *payloadIdentifier;
  void *v7;
  CEMApplicationLockDeclaration_AppOptions *payloadOptions;
  uint64_t v9;
  id v10;
  CEMApplicationLockDeclaration_AppUserEnabledOptions *payloadUserEnabledOptions;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadIdentifier = self->_payloadIdentifier;
  if (payloadIdentifier)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", self->_payloadIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Identifier"), payloadIdentifier, v7, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Identifier"), 0, 0, &stru_24C63AAC0);
  }
  payloadOptions = self->_payloadOptions;
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__CEMApplicationLockDeclaration_App_serializePayloadWithAssetProviders___block_invoke;
  v17[3] = &unk_24C638560;
  v10 = v4;
  v18 = v10;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Options"), payloadOptions, v17, 0, 0);
  payloadUserEnabledOptions = self->_payloadUserEnabledOptions;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __72__CEMApplicationLockDeclaration_App_serializePayloadWithAssetProviders___block_invoke_2;
  v15[3] = &unk_24C638560;
  v16 = v10;
  v12 = v10;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("UserEnabledOptions"), payloadUserEnabledOptions, v15, 0, 0);
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
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
  v12.super_class = (Class)CEMApplicationLockDeclaration_App;
  v4 = -[CEMPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadIdentifier, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[CEMApplicationLockDeclaration_AppOptions copy](self->_payloadOptions, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[CEMApplicationLockDeclaration_AppUserEnabledOptions copy](self->_payloadUserEnabledOptions, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CEMApplicationLockDeclaration_AppOptions)payloadOptions
{
  return self->_payloadOptions;
}

- (void)setPayloadOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CEMApplicationLockDeclaration_AppUserEnabledOptions)payloadUserEnabledOptions
{
  return self->_payloadUserEnabledOptions;
}

- (void)setPayloadUserEnabledOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUserEnabledOptions, 0);
  objc_storeStrong((id *)&self->_payloadOptions, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
}

@end
