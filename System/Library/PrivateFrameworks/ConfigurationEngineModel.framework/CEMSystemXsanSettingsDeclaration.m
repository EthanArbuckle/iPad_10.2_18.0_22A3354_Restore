@implementation CEMSystemXsanSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.xsan.settings");
}

+ (id)profileType
{
  return CFSTR("com.apple.xsan");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("sanName");
  v6[1] = CFSTR("sanConfigURLs");
  v6[2] = CFSTR("fsnameservers");
  v6[3] = CFSTR("sanAuthMethod");
  v6[4] = CFSTR("sharedSecret");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
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
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withSanName:(id)a4 withSanConfigURLs:(id)a5 withFsnameservers:(id)a6 withSanAuthMethod:(id)a7 withSharedSecret:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v13 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setDeclarationType:", CFSTR("com.apple.configuration.system.xsan.settings"));
  if (v13)
  {
    objc_msgSend(v19, "setDeclarationIdentifier:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDeclarationIdentifier:", v21);

  }
  objc_msgSend(v19, "setPayloadSanName:", v18);

  objc_msgSend(v19, "setPayloadSanConfigURLs:", v17);
  objc_msgSend(v19, "setPayloadFsnameservers:", v16);

  objc_msgSend(v19, "setPayloadSanAuthMethod:", v15);
  objc_msgSend(v19, "setPayloadSharedSecret:", v14);

  objc_msgSend(v19, "updateServerHash");
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withSanName:(id)a4 withSanConfigURLs:(id)a5 withFsnameservers:(id)a6 withSharedSecret:(id)a7
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
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.system.xsan.settings"));
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
  objc_msgSend(v16, "setPayloadSanName:", v15);

  objc_msgSend(v16, "setPayloadSanConfigURLs:", v14);
  objc_msgSend(v16, "setPayloadFsnameservers:", v13);

  objc_msgSend(v16, "setPayloadSharedSecret:", v12);
  objc_msgSend(v16, "updateServerHash");

  return v16;
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
  NSString *payloadSanName;
  NSArray *v16;
  NSArray *payloadSanConfigURLs;
  NSArray *v18;
  NSArray *payloadFsnameservers;
  NSString *v20;
  NSString *payloadSanAuthMethod;
  NSString *v22;
  NSString *payloadSharedSecret;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemXsanSettingsDeclaration allowedPayloadKeys](CEMSystemXsanSettingsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("sanName"), 1, 0, &v29);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadSanName = self->_payloadSanName;
  self->_payloadSanName = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("sanConfigURLs"), &__block_literal_global_40, 1, 0, &v28);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadSanConfigURLs = self->_payloadSanConfigURLs;
    self->_payloadSanConfigURLs = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("fsnameservers"), &__block_literal_global_23_1, 1, 0, &v27);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadFsnameservers = self->_payloadFsnameservers;
      self->_payloadFsnameservers = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("sanAuthMethod"), 0, 0, &v26);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadSanAuthMethod = self->_payloadSanAuthMethod;
        self->_payloadSanAuthMethod = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("sharedSecret"), 1, 0, &v25);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadSharedSecret = self->_payloadSharedSecret;
          self->_payloadSharedSecret = v22;

        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __54__CEMSystemXsanSettingsDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __54__CEMSystemXsanSettingsDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("sanName"), self->_payloadSanName, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("sanConfigURLs"), self->_payloadSanConfigURLs, &__block_literal_global_26, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("fsnameservers"), self->_payloadFsnameservers, &__block_literal_global_27_3, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("sanAuthMethod"), self->_payloadSanAuthMethod, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("sharedSecret"), self->_payloadSharedSecret, 1, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

id __71__CEMSystemXsanSettingsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __71__CEMSystemXsanSettingsDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMSystemXsanSettingsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadSanName, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSArray copy](self->_payloadSanConfigURLs, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSArray copy](self->_payloadFsnameservers, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSString copy](self->_payloadSanAuthMethod, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadSharedSecret, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSString)payloadSanName
{
  return self->_payloadSanName;
}

- (void)setPayloadSanName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)payloadSanConfigURLs
{
  return self->_payloadSanConfigURLs;
}

- (void)setPayloadSanConfigURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)payloadFsnameservers
{
  return self->_payloadFsnameservers;
}

- (void)setPayloadFsnameservers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadSanAuthMethod
{
  return self->_payloadSanAuthMethod;
}

- (void)setPayloadSanAuthMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadSharedSecret
{
  return self->_payloadSharedSecret;
}

- (void)setPayloadSharedSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSharedSecret, 0);
  objc_storeStrong((id *)&self->_payloadSanAuthMethod, 0);
  objc_storeStrong((id *)&self->_payloadFsnameservers, 0);
  objc_storeStrong((id *)&self->_payloadSanConfigURLs, 0);
  objc_storeStrong((id *)&self->_payloadSanName, 0);
}

@end
