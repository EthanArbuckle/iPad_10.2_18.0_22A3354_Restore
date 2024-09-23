@implementation CEMLegacyRestrictionsAppsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.legacy.restrictions.apps");
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
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowChat");
  v6[1] = CFSTR("allowiTunes");
  v6[2] = CFSTR("allowNews");
  v6[3] = CFSTR("allowPodcasts");
  v6[4] = CFSTR("allowSafari");
  v6[5] = CFSTR("allowVideoConferencing");
  v6[6] = CFSTR("blacklistedAppBundleIDs");
  v6[7] = CFSTR("allowGroupActivity");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
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
  _QWORD v6[9];

  v6[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowChat");
  v6[1] = CFSTR("allowiTunes");
  v6[2] = CFSTR("allowNews");
  v6[3] = CFSTR("allowPodcasts");
  v6[4] = CFSTR("allowSafari");
  v6[5] = CFSTR("allowVideoConferencing");
  v6[6] = CFSTR("blacklistedAppBundleIDs");
  v6[7] = CFSTR("allowGroupActivity");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

+ (id)buildWithIdentifier:(id)a3 withAllowChat:(id)a4 withAllowiTunes:(id)a5 withAllowNews:(id)a6 withAllowPodcasts:(id)a7 withAllowSafari:(id)a8 withAllowVideoConferencing:(id)a9 withBlacklistedAppBundleIDs:(id)a10 withAllowGroupActivity:(id)a11
{
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v38;

  v16 = a3;
  v38 = a11;
  v17 = a10;
  v18 = v16;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setDeclarationType:", CFSTR("com.apple.configuration.legacy.restrictions.apps"));
  if (v18)
  {
    objc_msgSend(v25, "setDeclarationIdentifier:", v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDeclarationIdentifier:", v27);

    v18 = 0;
  }
  v28 = (void *)MEMORY[0x24BDBD1C8];
  if (v24)
    v29 = v24;
  else
    v29 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v25, "setPayloadAllowChat:", v29);

  if (v23)
    v30 = v23;
  else
    v30 = v28;
  objc_msgSend(v25, "setPayloadAllowiTunes:", v30);

  if (v22)
    v31 = v22;
  else
    v31 = v28;
  objc_msgSend(v25, "setPayloadAllowNews:", v31);

  if (v21)
    v32 = v21;
  else
    v32 = v28;
  objc_msgSend(v25, "setPayloadAllowPodcasts:", v32);

  if (v20)
    v33 = v20;
  else
    v33 = v28;
  objc_msgSend(v25, "setPayloadAllowSafari:", v33);

  if (v19)
    v34 = v19;
  else
    v34 = v28;
  objc_msgSend(v25, "setPayloadAllowVideoConferencing:", v34);

  if (v17)
    v35 = v17;
  else
    v35 = (id)MEMORY[0x24BDBD1A8];
  objc_msgSend(v25, "setPayloadBlacklistedAppBundleIDs:", v35);

  if (v38)
    v36 = v38;
  else
    v36 = v28;
  objc_msgSend(v25, "setPayloadAllowGroupActivity:", v36);

  objc_msgSend(v25, "updateServerHash");
  return v25;
}

+ (id)buildWithIdentifier:(id)a3 withAllowChat:(id)a4 withAllowiTunes:(id)a5 withAllowNews:(id)a6 withAllowPodcasts:(id)a7 withAllowSafari:(id)a8 withAllowVideoConferencing:(id)a9 withBlacklistedAppBundleIDs:(id)a10 withAllowCopresence:(id)a11
{
  return (id)objc_msgSend(a1, "buildWithIdentifier:withAllowChat:withAllowiTunes:withAllowNews:withAllowPodcasts:withAllowSafari:withAllowVideoConferencing:withBlacklistedAppBundleIDs:withAllowGroupActivity:", a3, a4, a5, a6, a7, a8);
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.legacy.restrictions.apps"));
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
  NSNumber *payloadAllowChat;
  NSNumber *v16;
  NSNumber *payloadAllowiTunes;
  NSNumber *v18;
  NSNumber *payloadAllowNews;
  NSNumber *v20;
  NSNumber *payloadAllowPodcasts;
  NSNumber *v22;
  NSNumber *payloadAllowSafari;
  NSNumber *v24;
  NSNumber *payloadAllowVideoConferencing;
  NSArray *v26;
  NSArray *payloadBlacklistedAppBundleIDs;
  NSNumber *v28;
  NSNumber *payloadAllowGroupActivity;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMLegacyRestrictionsAppsDeclaration allowedPayloadKeys](CEMLegacyRestrictionsAppsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v38 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowChat"), 0, MEMORY[0x24BDBD1C8], &v38);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v38;
  payloadAllowChat = self->_payloadAllowChat;
  self->_payloadAllowChat = v13;

  if (!v14)
  {
    v37 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowiTunes"), 0, MEMORY[0x24BDBD1C8], &v37);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v37;
    payloadAllowiTunes = self->_payloadAllowiTunes;
    self->_payloadAllowiTunes = v16;

    if (!v14)
    {
      v36 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowNews"), 0, MEMORY[0x24BDBD1C8], &v36);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v36;
      payloadAllowNews = self->_payloadAllowNews;
      self->_payloadAllowNews = v18;

      if (!v14)
      {
        v35 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowPodcasts"), 0, MEMORY[0x24BDBD1C8], &v35);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v35;
        payloadAllowPodcasts = self->_payloadAllowPodcasts;
        self->_payloadAllowPodcasts = v20;

        if (!v14)
        {
          v34 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowSafari"), 0, MEMORY[0x24BDBD1C8], &v34);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v34;
          payloadAllowSafari = self->_payloadAllowSafari;
          self->_payloadAllowSafari = v22;

          if (!v14)
          {
            v33 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowVideoConferencing"), 0, MEMORY[0x24BDBD1C8], &v33);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v33;
            payloadAllowVideoConferencing = self->_payloadAllowVideoConferencing;
            self->_payloadAllowVideoConferencing = v24;

            if (!v14)
            {
              v32 = 0;
              -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("blacklistedAppBundleIDs"), &__block_literal_global_15, 0, 0, &v32);
              v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
              v14 = v32;
              payloadBlacklistedAppBundleIDs = self->_payloadBlacklistedAppBundleIDs;
              self->_payloadBlacklistedAppBundleIDs = v26;

              if (!v14)
              {
                v31 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowGroupActivity"), 0, MEMORY[0x24BDBD1C8], &v31);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v31;
                payloadAllowGroupActivity = self->_payloadAllowGroupActivity;
                self->_payloadAllowGroupActivity = v28;

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

uint64_t __58__CEMLegacyRestrictionsAppsDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowChat"), self->_payloadAllowChat, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowiTunes"), self->_payloadAllowiTunes, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowNews"), self->_payloadAllowNews, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowPodcasts"), self->_payloadAllowPodcasts, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowSafari"), self->_payloadAllowSafari, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowVideoConferencing"), self->_payloadAllowVideoConferencing, 0, v5);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("blacklistedAppBundleIDs"), self->_payloadBlacklistedAppBundleIDs, &__block_literal_global_29, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowGroupActivity"), self->_payloadAllowGroupActivity, 0, v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

id __75__CEMLegacyRestrictionsAppsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CEMLegacyRestrictionsAppsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v22, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowChat, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowiTunes, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowNews, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadAllowPodcasts, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowSafari, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadAllowVideoConferencing, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSArray copy](self->_payloadBlacklistedAppBundleIDs, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadAllowGroupActivity, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  return v4;
}

- (NSNumber)payloadAllowChat
{
  return self->_payloadAllowChat;
}

- (void)setPayloadAllowChat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowiTunes
{
  return self->_payloadAllowiTunes;
}

- (void)setPayloadAllowiTunes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowNews
{
  return self->_payloadAllowNews;
}

- (void)setPayloadAllowNews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadAllowPodcasts
{
  return self->_payloadAllowPodcasts;
}

- (void)setPayloadAllowPodcasts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadAllowSafari
{
  return self->_payloadAllowSafari;
}

- (void)setPayloadAllowSafari:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadAllowVideoConferencing
{
  return self->_payloadAllowVideoConferencing;
}

- (void)setPayloadAllowVideoConferencing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)payloadBlacklistedAppBundleIDs
{
  return self->_payloadBlacklistedAppBundleIDs;
}

- (void)setPayloadBlacklistedAppBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadAllowGroupActivity
{
  return self->_payloadAllowGroupActivity;
}

- (void)setPayloadAllowGroupActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowGroupActivity, 0);
  objc_storeStrong((id *)&self->_payloadBlacklistedAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_payloadAllowVideoConferencing, 0);
  objc_storeStrong((id *)&self->_payloadAllowSafari, 0);
  objc_storeStrong((id *)&self->_payloadAllowPodcasts, 0);
  objc_storeStrong((id *)&self->_payloadAllowNews, 0);
  objc_storeStrong((id *)&self->_payloadAllowiTunes, 0);
  objc_storeStrong((id *)&self->_payloadAllowChat, 0);
}

@end
