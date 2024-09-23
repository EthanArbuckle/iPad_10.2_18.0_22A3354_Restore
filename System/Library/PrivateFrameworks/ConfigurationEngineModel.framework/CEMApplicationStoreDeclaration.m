@implementation CEMApplicationStoreDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.application.store");
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
  _QWORD v6[11];

  v6[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowAppInstallation");
  v6[1] = CFSTR("allowAppClips");
  v6[2] = CFSTR("allowUIAppInstallation");
  v6[3] = CFSTR("allowAutomaticAppDownloads");
  v6[4] = CFSTR("allowSystemAppRemoval");
  v6[5] = CFSTR("allowAppRemoval");
  v6[6] = CFSTR("allowInAppPurchases");
  v6[7] = CFSTR("forceITunesStorePasswordEntry");
  v6[8] = CFSTR("allowMarketplaceAppInstallation");
  v6[9] = CFSTR("allowWebDistributionAppInstallation");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 10);
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
  _QWORD v6[11];

  v6[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowAppInstallation");
  v6[1] = CFSTR("allowAppClips");
  v6[2] = CFSTR("allowUIAppInstallation");
  v6[3] = CFSTR("allowAutomaticAppDownloads");
  v6[4] = CFSTR("allowSystemAppRemoval");
  v6[5] = CFSTR("allowAppRemoval");
  v6[6] = CFSTR("allowInAppPurchases");
  v6[7] = CFSTR("forceITunesStorePasswordEntry");
  v6[8] = CFSTR("allowMarketplaceAppInstallation");
  v6[9] = CFSTR("allowWebDistributionAppInstallation");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 10);
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
  return 1;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowAppClips:(id)a5 withAllowUIAppInstallation:(id)a6 withAllowAutomaticAppDownloads:(id)a7 withAllowSystemAppRemoval:(id)a8 withAllowAppRemoval:(id)a9 withAllowInAppPurchases:(id)a10 withForceITunesStorePasswordEntry:(id)a11 withAllowMarketplaceAppInstallation:(id)a12 withAllowWebDistributionAppInstallation:(id)a13
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v41;
  id v42;
  id v43;

  v16 = a3;
  v43 = a13;
  v42 = a12;
  v41 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setDeclarationType:", CFSTR("com.apple.configuration.application.store"));
  if (v16)
  {
    objc_msgSend(v24, "setDeclarationIdentifier:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDeclarationIdentifier:", v26);

    v16 = 0;
  }
  v27 = (void *)MEMORY[0x24BDBD1C8];
  if (v23)
    v28 = v23;
  else
    v28 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v24, "setPayloadAllowAppInstallation:", v28);

  if (v22)
    v29 = v22;
  else
    v29 = v27;
  objc_msgSend(v24, "setPayloadAllowAppClips:", v29);

  if (v21)
    v30 = v21;
  else
    v30 = v27;
  objc_msgSend(v24, "setPayloadAllowUIAppInstallation:", v30);

  if (v20)
    v31 = v20;
  else
    v31 = v27;
  objc_msgSend(v24, "setPayloadAllowAutomaticAppDownloads:", v31);

  if (v19)
    v32 = v19;
  else
    v32 = v27;
  objc_msgSend(v24, "setPayloadAllowSystemAppRemoval:", v32);

  if (v18)
    v33 = v18;
  else
    v33 = v27;
  objc_msgSend(v24, "setPayloadAllowAppRemoval:", v33);

  if (v17)
    v34 = v17;
  else
    v34 = v27;
  objc_msgSend(v24, "setPayloadAllowInAppPurchases:", v34);

  if (v41)
    v35 = v41;
  else
    v35 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v24, "setPayloadForceITunesStorePasswordEntry:", v35);

  if (v42)
    v36 = v42;
  else
    v36 = v27;
  objc_msgSend(v24, "setPayloadAllowMarketplaceAppInstallation:", v36);

  if (v43)
    v37 = v43;
  else
    v37 = v27;
  objc_msgSend(v24, "setPayloadAllowWebDistributionAppInstallation:", v37);

  objc_msgSend(v24, "updateServerHash");
  return v24;
}

+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowAppClips:(id)a5 withAllowUIAppInstallation:(id)a6 withAllowAutomaticAppDownloads:(id)a7 withAllowSystemAppRemoval:(id)a8 withAllowAppRemoval:(id)a9 withAllowInAppPurchases:(id)a10 withForceITunesStorePasswordEntry:(id)a11 withAllowMarketPlaceAppInstallation:(id)a12
{
  return (id)objc_msgSend(a1, "buildWithIdentifier:withAllowAppInstallation:withAllowAppClips:withAllowUIAppInstallation:withAllowAutomaticAppDownloads:withAllowSystemAppRemoval:withAllowAppRemoval:withAllowInAppPurchases:withForceITunesStorePasswordEntry:withAllowMarketplaceAppInstallation:withAllowWebDistributionAppInstallation:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0);
}

+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowAppClips:(id)a5 withAllowUIAppInstallation:(id)a6 withAllowAutomaticAppDownloads:(id)a7 withAllowSystemAppRemoval:(id)a8 withAllowAppRemoval:(id)a9 withAllowInAppPurchases:(id)a10 withForceITunesStorePasswordEntry:(id)a11
{
  return (id)objc_msgSend(a1, "buildWithIdentifier:withAllowAppInstallation:withAllowAppClips:withAllowUIAppInstallation:withAllowAutomaticAppDownloads:withAllowSystemAppRemoval:withAllowAppRemoval:withAllowInAppPurchases:withForceITunesStorePasswordEntry:withAllowMarketPlaceAppInstallation:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0);
}

+ (id)buildWithIdentifier:(id)a3 withAllowAppInstallation:(id)a4 withAllowUIAppInstallation:(id)a5 withAllowAutomaticAppDownloads:(id)a6 withAllowSystemAppRemoval:(id)a7 withAllowAppRemoval:(id)a8 withAllowInAppPurchases:(id)a9 withForceITunesStorePasswordEntry:(id)a10
{
  return (id)objc_msgSend(a1, "buildWithIdentifier:withAllowAppInstallation:withAllowAppClips:withAllowUIAppInstallation:withAllowAutomaticAppDownloads:withAllowSystemAppRemoval:withAllowAppRemoval:withAllowInAppPurchases:withForceITunesStorePasswordEntry:", a3, a4, 0, a5, a6, a7, a8, a9, a10);
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.application.store"));
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
  NSNumber *payloadAllowAppInstallation;
  NSNumber *v16;
  NSNumber *payloadAllowAppClips;
  NSNumber *v18;
  NSNumber *payloadAllowUIAppInstallation;
  NSNumber *v20;
  NSNumber *payloadAllowAutomaticAppDownloads;
  NSNumber *v22;
  NSNumber *payloadAllowSystemAppRemoval;
  NSNumber *v24;
  NSNumber *payloadAllowAppRemoval;
  NSNumber *v26;
  NSNumber *payloadAllowInAppPurchases;
  NSNumber *v28;
  NSNumber *payloadForceITunesStorePasswordEntry;
  NSNumber *v30;
  NSNumber *payloadAllowMarketplaceAppInstallation;
  NSNumber *v32;
  NSNumber *payloadAllowWebDistributionAppInstallation;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationStoreDeclaration allowedPayloadKeys](CEMApplicationStoreDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v44 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAppInstallation"), 0, MEMORY[0x24BDBD1C8], &v44);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v44;
  payloadAllowAppInstallation = self->_payloadAllowAppInstallation;
  self->_payloadAllowAppInstallation = v13;

  if (!v14)
  {
    v43 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAppClips"), 0, MEMORY[0x24BDBD1C8], &v43);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v43;
    payloadAllowAppClips = self->_payloadAllowAppClips;
    self->_payloadAllowAppClips = v16;

    if (!v14)
    {
      v42 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowUIAppInstallation"), 0, MEMORY[0x24BDBD1C8], &v42);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v42;
      payloadAllowUIAppInstallation = self->_payloadAllowUIAppInstallation;
      self->_payloadAllowUIAppInstallation = v18;

      if (!v14)
      {
        v41 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAutomaticAppDownloads"), 0, MEMORY[0x24BDBD1C8], &v41);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v41;
        payloadAllowAutomaticAppDownloads = self->_payloadAllowAutomaticAppDownloads;
        self->_payloadAllowAutomaticAppDownloads = v20;

        if (!v14)
        {
          v40 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowSystemAppRemoval"), 0, MEMORY[0x24BDBD1C8], &v40);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v40;
          payloadAllowSystemAppRemoval = self->_payloadAllowSystemAppRemoval;
          self->_payloadAllowSystemAppRemoval = v22;

          if (!v14)
          {
            v39 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAppRemoval"), 0, MEMORY[0x24BDBD1C8], &v39);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v39;
            payloadAllowAppRemoval = self->_payloadAllowAppRemoval;
            self->_payloadAllowAppRemoval = v24;

            if (!v14)
            {
              v38 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowInAppPurchases"), 0, MEMORY[0x24BDBD1C8], &v38);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v38;
              payloadAllowInAppPurchases = self->_payloadAllowInAppPurchases;
              self->_payloadAllowInAppPurchases = v26;

              if (!v14)
              {
                v37 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("forceITunesStorePasswordEntry"), 0, MEMORY[0x24BDBD1C0], &v37);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v37;
                payloadForceITunesStorePasswordEntry = self->_payloadForceITunesStorePasswordEntry;
                self->_payloadForceITunesStorePasswordEntry = v28;

                if (!v14)
                {
                  v36 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowMarketplaceAppInstallation"), 0, MEMORY[0x24BDBD1C8], &v36);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v36;
                  payloadAllowMarketplaceAppInstallation = self->_payloadAllowMarketplaceAppInstallation;
                  self->_payloadAllowMarketplaceAppInstallation = v30;

                  if (!v14)
                  {
                    v35 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowWebDistributionAppInstallation"), 0, MEMORY[0x24BDBD1C8], &v35);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v35;
                    payloadAllowWebDistributionAppInstallation = self->_payloadAllowWebDistributionAppInstallation;
                    self->_payloadAllowWebDistributionAppInstallation = v32;

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

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAppInstallation"), self->_payloadAllowAppInstallation, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAppClips"), self->_payloadAllowAppClips, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowUIAppInstallation"), self->_payloadAllowUIAppInstallation, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAutomaticAppDownloads"), self->_payloadAllowAutomaticAppDownloads, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowSystemAppRemoval"), self->_payloadAllowSystemAppRemoval, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAppRemoval"), self->_payloadAllowAppRemoval, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowInAppPurchases"), self->_payloadAllowInAppPurchases, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("forceITunesStorePasswordEntry"), self->_payloadForceITunesStorePasswordEntry, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowMarketplaceAppInstallation"), self->_payloadAllowMarketplaceAppInstallation, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowWebDistributionAppInstallation"), self->_payloadAllowWebDistributionAppInstallation, 0, v5);
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
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CEMApplicationStoreDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v26, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowAppInstallation, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowAppClips, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowUIAppInstallation, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadAllowAutomaticAppDownloads, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowSystemAppRemoval, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadAllowAppRemoval, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadAllowInAppPurchases, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadForceITunesStorePasswordEntry, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadAllowMarketplaceAppInstallation, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSNumber copy](self->_payloadAllowWebDistributionAppInstallation, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  return v4;
}

- (NSNumber)payloadAllowAppInstallation
{
  return self->_payloadAllowAppInstallation;
}

- (void)setPayloadAllowAppInstallation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowAppClips
{
  return self->_payloadAllowAppClips;
}

- (void)setPayloadAllowAppClips:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowUIAppInstallation
{
  return self->_payloadAllowUIAppInstallation;
}

- (void)setPayloadAllowUIAppInstallation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadAllowAutomaticAppDownloads
{
  return self->_payloadAllowAutomaticAppDownloads;
}

- (void)setPayloadAllowAutomaticAppDownloads:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadAllowSystemAppRemoval
{
  return self->_payloadAllowSystemAppRemoval;
}

- (void)setPayloadAllowSystemAppRemoval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadAllowAppRemoval
{
  return self->_payloadAllowAppRemoval;
}

- (void)setPayloadAllowAppRemoval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadAllowInAppPurchases
{
  return self->_payloadAllowInAppPurchases;
}

- (void)setPayloadAllowInAppPurchases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadForceITunesStorePasswordEntry
{
  return self->_payloadForceITunesStorePasswordEntry;
}

- (void)setPayloadForceITunesStorePasswordEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadAllowMarketplaceAppInstallation
{
  return self->_payloadAllowMarketplaceAppInstallation;
}

- (void)setPayloadAllowMarketplaceAppInstallation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadAllowWebDistributionAppInstallation
{
  return self->_payloadAllowWebDistributionAppInstallation;
}

- (void)setPayloadAllowWebDistributionAppInstallation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowWebDistributionAppInstallation, 0);
  objc_storeStrong((id *)&self->_payloadAllowMarketplaceAppInstallation, 0);
  objc_storeStrong((id *)&self->_payloadForceITunesStorePasswordEntry, 0);
  objc_storeStrong((id *)&self->_payloadAllowInAppPurchases, 0);
  objc_storeStrong((id *)&self->_payloadAllowAppRemoval, 0);
  objc_storeStrong((id *)&self->_payloadAllowSystemAppRemoval, 0);
  objc_storeStrong((id *)&self->_payloadAllowAutomaticAppDownloads, 0);
  objc_storeStrong((id *)&self->_payloadAllowUIAppInstallation, 0);
  objc_storeStrong((id *)&self->_payloadAllowAppClips, 0);
  objc_storeStrong((id *)&self->_payloadAllowAppInstallation, 0);
}

@end
