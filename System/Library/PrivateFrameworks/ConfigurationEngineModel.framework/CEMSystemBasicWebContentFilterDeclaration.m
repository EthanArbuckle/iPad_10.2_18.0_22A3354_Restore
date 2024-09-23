@implementation CEMSystemBasicWebContentFilterDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.web.contentfilter.basic");
}

+ (id)profileType
{
  return CFSTR("com.apple.familycontrols.contentfilter");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("restrictWeb");
  v6[1] = CFSTR("useContentFilter");
  v6[2] = CFSTR("whiteListEnabled");
  v6[3] = CFSTR("siteWhiteList");
  v6[4] = CFSTR("filterWhiteList");
  v6[5] = CFSTR("filterBlackList");
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

+ (id)buildWithIdentifier:(id)a3 withRestrictWeb:(id)a4 withUseContentFilter:(id)a5 withWhiteListEnabled:(id)a6 withSiteWhiteList:(id)a7 withFilterWhiteList:(id)a8 withFilterBlackList:(id)a9
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
  void *v24;
  id v25;
  id v26;

  v14 = a3;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setDeclarationType:", CFSTR("com.apple.configuration.system.web.contentfilter.basic"));
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
  objc_msgSend(v21, "setPayloadRestrictWeb:", v20);

  v24 = (void *)MEMORY[0x24BDBD1C0];
  if (v19)
    v25 = v19;
  else
    v25 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v21, "setPayloadUseContentFilter:", v25);

  if (v18)
    v26 = v18;
  else
    v26 = v24;
  objc_msgSend(v21, "setPayloadWhiteListEnabled:", v26);

  objc_msgSend(v21, "setPayloadSiteWhiteList:", v17);
  objc_msgSend(v21, "setPayloadFilterWhiteList:", v16);

  objc_msgSend(v21, "setPayloadFilterBlackList:", v15);
  objc_msgSend(v21, "updateServerHash");

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withRestrictWeb:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.system.web.contentfilter.basic"));
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
  objc_msgSend(v7, "setPayloadRestrictWeb:", v6);

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
  NSNumber *v13;
  id v14;
  NSNumber *payloadRestrictWeb;
  NSNumber *v16;
  NSNumber *payloadUseContentFilter;
  NSNumber *v18;
  NSNumber *payloadWhiteListEnabled;
  NSArray *v20;
  NSArray *payloadSiteWhiteList;
  NSArray *v22;
  NSArray *payloadFilterWhiteList;
  NSArray *v24;
  NSArray *payloadFilterBlackList;
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

  +[CEMSystemBasicWebContentFilterDeclaration allowedPayloadKeys](CEMSystemBasicWebContentFilterDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v32 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("restrictWeb"), 1, 0, &v32);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  payloadRestrictWeb = self->_payloadRestrictWeb;
  self->_payloadRestrictWeb = v13;

  if (!v14)
  {
    v31 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("useContentFilter"), 0, MEMORY[0x24BDBD1C0], &v31);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    payloadUseContentFilter = self->_payloadUseContentFilter;
    self->_payloadUseContentFilter = v16;

    if (!v14)
    {
      v30 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("whiteListEnabled"), 0, MEMORY[0x24BDBD1C0], &v30);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      payloadWhiteListEnabled = self->_payloadWhiteListEnabled;
      self->_payloadWhiteListEnabled = v18;

      if (!v14)
      {
        v29 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("siteWhiteList"), objc_opt_class(), 0, 0, 0, &v29);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        payloadSiteWhiteList = self->_payloadSiteWhiteList;
        self->_payloadSiteWhiteList = v20;

        if (!v14)
        {
          v28 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("filterWhiteList"), &__block_literal_global_38, 0, 0, &v28);
          v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          payloadFilterWhiteList = self->_payloadFilterWhiteList;
          self->_payloadFilterWhiteList = v22;

          if (!v14)
          {
            v27 = 0;
            -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("filterBlackList"), &__block_literal_global_24, 0, 0, &v27);
            v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v14 = v27;
            payloadFilterBlackList = self->_payloadFilterBlackList;
            self->_payloadFilterBlackList = v24;

          }
        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __63__CEMSystemBasicWebContentFilterDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __63__CEMSystemBasicWebContentFilterDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
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
  id v4;
  void *v5;
  uint64_t v6;
  NSArray *payloadSiteWhiteList;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("restrictWeb"), self->_payloadRestrictWeb, 1, 0);
  v6 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("useContentFilter"), self->_payloadUseContentFilter, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("whiteListEnabled"), self->_payloadWhiteListEnabled, 0, v6);
  payloadSiteWhiteList = self->_payloadSiteWhiteList;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__CEMSystemBasicWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v11[3] = &unk_24C63A210;
  v12 = v4;
  v8 = v4;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("siteWhiteList"), payloadSiteWhiteList, v11, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("filterWhiteList"), self->_payloadFilterWhiteList, &__block_literal_global_28, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("filterBlackList"), self->_payloadFilterBlackList, &__block_literal_global_29_0, 0, 0);
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

uint64_t __80__CEMSystemBasicWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

id __80__CEMSystemBasicWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __80__CEMSystemBasicWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CEMSystemBasicWebContentFilterDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadRestrictWeb, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadUseContentFilter, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadWhiteListEnabled, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSArray copy](self->_payloadSiteWhiteList, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSArray copy](self->_payloadFilterWhiteList, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSArray copy](self->_payloadFilterBlackList, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (id)synthesizeProfileOutUUIDs:(id)a3 withOldUUIDs:(id)a4 assetProviders:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)CEMSystemBasicWebContentFilterDeclaration;
  -[CEMConfigurationBase synthesizeProfileOutUUIDs:withOldUUIDs:assetProviders:](&v26, sel_synthesizeProfileOutUUIDs_withOldUUIDs_assetProviders_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PayloadContent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("com.apple.applicationaccess"), CFSTR("PayloadType"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("restrictWeb"));
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("siteWhiteList"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CEMSystemBasicWebContentFilterDeclaration payloadRestrictWeb](self, "payloadRestrictWeb");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "BOOLValue"))
    {
      -[CEMSystemBasicWebContentFilterDeclaration payloadWhiteListEnabled](self, "payloadWhiteListEnabled");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      if (!v14)
        goto LABEL_6;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("siteWhiteList"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "valueForKey:", CFSTR("address"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("webContentFilterWhitelistedURLs"));

      objc_msgSend(v12, "valueForKey:", CFSTR("pageTitle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("webContentFilterWhitelistedBookmarks"));

    }
  }
LABEL_6:
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("whiteListEnabled"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("siteWhiteList"));
  -[CEMSystemBasicWebContentFilterDeclaration payloadRestrictWeb](self, "payloadRestrictWeb");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "BOOLValue"))
  {
LABEL_9:

    goto LABEL_10;
  }
  -[CEMSystemBasicWebContentFilterDeclaration payloadUseContentFilter](self, "payloadUseContentFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (v19)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("useContentFilter"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("forceWebContentFilterAuto"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("filterWhiteList"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("webContentFilterAutoPermittedURLs"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("filterBlackList"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("webContentFilterBlacklistedURLs"));
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("useContentFilter"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("filterWhiteList"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, CFSTR("filterBlackList"));
  v22 = (void *)objc_msgSend(v10, "copy");
  v27[0] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("PayloadContent"));

  v24 = (void *)objc_msgSend(v7, "copy");
  return v24;
}

- (NSNumber)payloadRestrictWeb
{
  return self->_payloadRestrictWeb;
}

- (void)setPayloadRestrictWeb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadUseContentFilter
{
  return self->_payloadUseContentFilter;
}

- (void)setPayloadUseContentFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadWhiteListEnabled
{
  return self->_payloadWhiteListEnabled;
}

- (void)setPayloadWhiteListEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)payloadSiteWhiteList
{
  return self->_payloadSiteWhiteList;
}

- (void)setPayloadSiteWhiteList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)payloadFilterWhiteList
{
  return self->_payloadFilterWhiteList;
}

- (void)setPayloadFilterWhiteList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)payloadFilterBlackList
{
  return self->_payloadFilterBlackList;
}

- (void)setPayloadFilterBlackList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFilterBlackList, 0);
  objc_storeStrong((id *)&self->_payloadFilterWhiteList, 0);
  objc_storeStrong((id *)&self->_payloadSiteWhiteList, 0);
  objc_storeStrong((id *)&self->_payloadWhiteListEnabled, 0);
  objc_storeStrong((id *)&self->_payloadUseContentFilter, 0);
  objc_storeStrong((id *)&self->_payloadRestrictWeb, 0);
}

@end
