@implementation CEMSystemWebContentFilterDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.web.contentfilter");
}

+ (id)profileType
{
  return CFSTR("com.apple.webcontent-filter");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[16];

  v6[15] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("FilterType");
  v6[1] = CFSTR("AutoFilterEnabled");
  v6[2] = CFSTR("PermittedURLs");
  v6[3] = CFSTR("BlacklistedURLs");
  v6[4] = CFSTR("WhitelistedBookmarks");
  v6[5] = CFSTR("UserDefinedName");
  v6[6] = CFSTR("PluginBundleID");
  v6[7] = CFSTR("ServerAddress");
  v6[8] = CFSTR("UserName");
  v6[9] = CFSTR("Password");
  v6[10] = CFSTR("Certificate");
  v6[11] = CFSTR("Organization");
  v6[12] = CFSTR("VendorConfig");
  v6[13] = CFSTR("FilterBrowsers");
  v6[14] = CFSTR("FilterSockets");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 15);
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
  return 1;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMSystemWebContentFilterDeclaration payloadCertificate](self, "payloadCertificate");
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

+ (id)buildWithIdentifier:(id)a3 withFilterType:(id)a4 withAutoFilterEnabled:(id)a5 withPermittedURLs:(id)a6 withBlacklistedURLs:(id)a7 withWhitelistedBookmarks:(id)a8 withUserDefinedName:(id)a9 withPluginBundleID:(id)a10 withServerAddress:(id)a11 withUserName:(id)a12 withPassword:(id)a13 withCertificate:(id)a14 withOrganization:(id)a15 withVendorConfig:(id)a16 withFilterBrowsers:(id)a17 withFilterSockets:(id)a18
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v18 = a3;
  v47 = a18;
  v46 = a17;
  v45 = a16;
  v44 = a15;
  v43 = a14;
  v42 = a13;
  v41 = a12;
  v40 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = (__CFString *)a4;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setDeclarationType:", CFSTR("com.apple.configuration.system.web.contentfilter"));
  if (v18)
  {
    objc_msgSend(v26, "setDeclarationIdentifier:", v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDeclarationIdentifier:", v28);

    v18 = 0;
  }
  if (v25)
    v29 = v25;
  else
    v29 = CFSTR("BuiltIn");
  objc_msgSend(v26, "setPayloadFilterType:", v29, a9);

  v30 = (void *)MEMORY[0x24BDBD1C8];
  if (v24)
    v31 = v24;
  else
    v31 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v26, "setPayloadAutoFilterEnabled:", v31);

  objc_msgSend(v26, "setPayloadPermittedURLs:", v23);
  objc_msgSend(v26, "setPayloadBlacklistedURLs:", v22);

  objc_msgSend(v26, "setPayloadWhitelistedBookmarks:", v21);
  objc_msgSend(v26, "setPayloadUserDefinedName:", v20);

  objc_msgSend(v26, "setPayloadPluginBundleID:", v19);
  objc_msgSend(v26, "setPayloadServerAddress:", v40);

  objc_msgSend(v26, "setPayloadUserName:", v41);
  objc_msgSend(v26, "setPayloadPassword:", v42);

  objc_msgSend(v26, "setPayloadCertificate:", v43);
  objc_msgSend(v26, "setPayloadOrganization:", v44);

  objc_msgSend(v26, "setPayloadVendorConfig:", v45);
  if (v46)
    v32 = v46;
  else
    v32 = v30;
  objc_msgSend(v26, "setPayloadFilterBrowsers:", v32);

  if (v47)
    v33 = v47;
  else
    v33 = v30;
  objc_msgSend(v26, "setPayloadFilterSockets:", v33);

  objc_msgSend(v26, "updateServerHash");
  return v26;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.web.contentfilter"));
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
  NSString *v13;
  id v14;
  NSString *payloadFilterType;
  NSNumber *v16;
  NSNumber *payloadAutoFilterEnabled;
  NSArray *v18;
  NSArray *payloadPermittedURLs;
  NSArray *v20;
  NSArray *payloadBlacklistedURLs;
  NSArray *v22;
  NSArray *payloadWhitelistedBookmarks;
  NSString *v24;
  NSString *payloadUserDefinedName;
  NSString *v26;
  NSString *payloadPluginBundleID;
  NSString *v28;
  NSString *payloadServerAddress;
  NSString *v30;
  NSString *payloadUserName;
  NSString *v32;
  NSString *payloadPassword;
  NSString *v34;
  NSString *payloadCertificate;
  NSString *v36;
  NSString *payloadOrganization;
  CEMAnyPayload *v38;
  CEMAnyPayload *payloadVendorConfig;
  NSNumber *v40;
  NSNumber *payloadFilterBrowsers;
  NSNumber *v42;
  NSNumber *payloadFilterSockets;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemWebContentFilterDeclaration allowedPayloadKeys](CEMSystemWebContentFilterDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v59 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FilterType"), 0, CFSTR("BuiltIn"), &v59);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v59;
  payloadFilterType = self->_payloadFilterType;
  self->_payloadFilterType = v13;

  if (!v14)
  {
    v58 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AutoFilterEnabled"), 0, MEMORY[0x24BDBD1C8], &v58);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v58;
    payloadAutoFilterEnabled = self->_payloadAutoFilterEnabled;
    self->_payloadAutoFilterEnabled = v16;

    if (!v14)
    {
      v57 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("PermittedURLs"), &__block_literal_global_39, 0, 0, &v57);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = v57;
      payloadPermittedURLs = self->_payloadPermittedURLs;
      self->_payloadPermittedURLs = v18;

      if (!v14)
      {
        v56 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("BlacklistedURLs"), &__block_literal_global_49, 0, 0, &v56);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v56;
        payloadBlacklistedURLs = self->_payloadBlacklistedURLs;
        self->_payloadBlacklistedURLs = v20;

        if (!v14)
        {
          v55 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("WhitelistedBookmarks"), objc_opt_class(), 0, 0, 0, &v55);
          v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = v55;
          payloadWhitelistedBookmarks = self->_payloadWhitelistedBookmarks;
          self->_payloadWhitelistedBookmarks = v22;

          if (!v14)
          {
            v54 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UserDefinedName"), 0, 0, &v54);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v54;
            payloadUserDefinedName = self->_payloadUserDefinedName;
            self->_payloadUserDefinedName = v24;

            if (!v14)
            {
              v53 = 0;
              -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PluginBundleID"), 0, 0, &v53);
              v26 = (NSString *)objc_claimAutoreleasedReturnValue();
              v14 = v53;
              payloadPluginBundleID = self->_payloadPluginBundleID;
              self->_payloadPluginBundleID = v26;

              if (!v14)
              {
                v52 = 0;
                -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ServerAddress"), 0, 0, &v52);
                v28 = (NSString *)objc_claimAutoreleasedReturnValue();
                v14 = v52;
                payloadServerAddress = self->_payloadServerAddress;
                self->_payloadServerAddress = v28;

                if (!v14)
                {
                  v51 = 0;
                  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UserName"), 0, 0, &v51);
                  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v14 = v51;
                  payloadUserName = self->_payloadUserName;
                  self->_payloadUserName = v30;

                  if (!v14)
                  {
                    v50 = 0;
                    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Password"), 0, 0, &v50);
                    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v14 = v50;
                    payloadPassword = self->_payloadPassword;
                    self->_payloadPassword = v32;

                    if (!v14)
                    {
                      v49 = 0;
                      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Certificate"), 0, 0, &v49);
                      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
                      v14 = v49;
                      payloadCertificate = self->_payloadCertificate;
                      self->_payloadCertificate = v34;

                      if (!v14)
                      {
                        v48 = 0;
                        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Organization"), 0, 0, &v48);
                        v36 = (NSString *)objc_claimAutoreleasedReturnValue();
                        v14 = v48;
                        payloadOrganization = self->_payloadOrganization;
                        self->_payloadOrganization = v36;

                        if (!v14)
                        {
                          v47 = 0;
                          -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("VendorConfig"), objc_opt_class(), 0, 0, &v47);
                          v38 = (CEMAnyPayload *)objc_claimAutoreleasedReturnValue();
                          v14 = v47;
                          payloadVendorConfig = self->_payloadVendorConfig;
                          self->_payloadVendorConfig = v38;

                          if (!v14)
                          {
                            v46 = 0;
                            -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FilterBrowsers"), 0, MEMORY[0x24BDBD1C8], &v46);
                            v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                            v14 = v46;
                            payloadFilterBrowsers = self->_payloadFilterBrowsers;
                            self->_payloadFilterBrowsers = v40;

                            if (!v14)
                            {
                              v45 = 0;
                              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FilterSockets"), 0, MEMORY[0x24BDBD1C8], &v45);
                              v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                              v14 = v45;
                              payloadFilterSockets = self->_payloadFilterSockets;
                              self->_payloadFilterSockets = v42;

                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
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

uint64_t __58__CEMSystemWebContentFilterDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __58__CEMSystemWebContentFilterDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
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
  NSArray *payloadWhitelistedBookmarks;
  id v7;
  NSString *payloadCertificate;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("FilterType"), self->_payloadFilterType, 0, CFSTR("BuiltIn"));
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("AutoFilterEnabled"), self->_payloadAutoFilterEnabled, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("PermittedURLs"), self->_payloadPermittedURLs, &__block_literal_global_54, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("BlacklistedURLs"), self->_payloadBlacklistedURLs, &__block_literal_global_55_1, 0, 0);
  payloadWhitelistedBookmarks = self->_payloadWhitelistedBookmarks;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __75__CEMSystemWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v16 = &unk_24C63A858;
  v7 = v4;
  v17 = v7;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("WhitelistedBookmarks"), payloadWhitelistedBookmarks, &v13, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("UserDefinedName"), self->_payloadUserDefinedName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("PluginBundleID"), self->_payloadPluginBundleID, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("ServerAddress"), self->_payloadServerAddress, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("UserName"), self->_payloadUserName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Password"), self->_payloadPassword, 0, 0);
  payloadCertificate = self->_payloadCertificate;
  if (payloadCertificate)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", self->_payloadCertificate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Certificate"), payloadCertificate, v9, &stru_24C63AAC0, v13, v14, v15, v16);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Certificate"), 0, 0, &stru_24C63AAC0, v13, v14, v15, v16);
  }
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Organization"), self->_payloadOrganization, 0, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("VendorConfig"), self->_payloadVendorConfig, &__block_literal_global_60_0, 0, 0);
  v10 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("FilterBrowsers"), self->_payloadFilterBrowsers, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("FilterSockets"), self->_payloadFilterSockets, 0, v10);
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

id __75__CEMSystemWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __75__CEMSystemWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __75__CEMSystemWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __75__CEMSystemWebContentFilterDeclaration_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CEMSystemWebContentFilterDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v36, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadFilterType, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAutoFilterEnabled, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSArray copy](self->_payloadPermittedURLs, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSArray copy](self->_payloadBlacklistedURLs, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSArray copy](self->_payloadWhitelistedBookmarks, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadUserDefinedName, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSString copy](self->_payloadPluginBundleID, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSString copy](self->_payloadServerAddress, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSString copy](self->_payloadUserName, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSString copy](self->_payloadPassword, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSString copy](self->_payloadCertificate, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSString copy](self->_payloadOrganization, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[CEMAnyPayload copy](self->_payloadVendorConfig, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[NSNumber copy](self->_payloadFilterBrowsers, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  v33 = -[NSNumber copy](self->_payloadFilterSockets, "copy");
  v34 = (void *)v4[23];
  v4[23] = v33;

  return v4;
}

- (NSString)payloadFilterType
{
  return self->_payloadFilterType;
}

- (void)setPayloadFilterType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAutoFilterEnabled
{
  return self->_payloadAutoFilterEnabled;
}

- (void)setPayloadAutoFilterEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)payloadPermittedURLs
{
  return self->_payloadPermittedURLs;
}

- (void)setPayloadPermittedURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)payloadBlacklistedURLs
{
  return self->_payloadBlacklistedURLs;
}

- (void)setPayloadBlacklistedURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)payloadWhitelistedBookmarks
{
  return self->_payloadWhitelistedBookmarks;
}

- (void)setPayloadWhitelistedBookmarks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadUserDefinedName
{
  return self->_payloadUserDefinedName;
}

- (void)setPayloadUserDefinedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)payloadPluginBundleID
{
  return self->_payloadPluginBundleID;
}

- (void)setPayloadPluginBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)payloadServerAddress
{
  return self->_payloadServerAddress;
}

- (void)setPayloadServerAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)payloadUserName
{
  return self->_payloadUserName;
}

- (void)setPayloadUserName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)payloadCertificate
{
  return self->_payloadCertificate;
}

- (void)setPayloadCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)payloadOrganization
{
  return self->_payloadOrganization;
}

- (void)setPayloadOrganization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (CEMAnyPayload)payloadVendorConfig
{
  return self->_payloadVendorConfig;
}

- (void)setPayloadVendorConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)payloadFilterBrowsers
{
  return self->_payloadFilterBrowsers;
}

- (void)setPayloadFilterBrowsers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)payloadFilterSockets
{
  return self->_payloadFilterSockets;
}

- (void)setPayloadFilterSockets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFilterSockets, 0);
  objc_storeStrong((id *)&self->_payloadFilterBrowsers, 0);
  objc_storeStrong((id *)&self->_payloadVendorConfig, 0);
  objc_storeStrong((id *)&self->_payloadOrganization, 0);
  objc_storeStrong((id *)&self->_payloadCertificate, 0);
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadUserName, 0);
  objc_storeStrong((id *)&self->_payloadServerAddress, 0);
  objc_storeStrong((id *)&self->_payloadPluginBundleID, 0);
  objc_storeStrong((id *)&self->_payloadUserDefinedName, 0);
  objc_storeStrong((id *)&self->_payloadWhitelistedBookmarks, 0);
  objc_storeStrong((id *)&self->_payloadBlacklistedURLs, 0);
  objc_storeStrong((id *)&self->_payloadPermittedURLs, 0);
  objc_storeStrong((id *)&self->_payloadAutoFilterEnabled, 0);
  objc_storeStrong((id *)&self->_payloadFilterType, 0);
}

@end
