@implementation CEMSystemMusicDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.music");
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
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowMusicService");
  v6[1] = CFSTR("allowRadioService");
  v6[2] = CFSTR("allowMusicArtistActivity");
  v6[3] = CFSTR("allowMusicVideos");
  v6[4] = CFSTR("allowSharedMediaLibraries");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
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
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowMusicService");
  v6[1] = CFSTR("allowRadioService");
  v6[2] = CFSTR("allowMusicArtistActivity");
  v6[3] = CFSTR("allowMusicVideos");
  v6[4] = CFSTR("allowSharedMediaLibraries");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
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

+ (id)buildWithIdentifier:(id)a3 withAllowMusicService:(id)a4 withAllowRadioService:(id)a5 withAllowMusicArtistActivity:(id)a6 withAllowMusicVideos:(id)a7 withAllowSharedLibraries:(id)a8
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
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v13 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setDeclarationType:", CFSTR("com.apple.configuration.system.music"));
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
  v22 = (void *)MEMORY[0x24BDBD1C8];
  if (v18)
    v23 = v18;
  else
    v23 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v19, "setPayloadAllowMusicService:", v23);

  if (v17)
    v24 = v17;
  else
    v24 = v22;
  objc_msgSend(v19, "setPayloadAllowRadioService:", v24);

  if (v16)
    v25 = v16;
  else
    v25 = v22;
  objc_msgSend(v19, "setPayloadAllowMusicArtistActivity:", v25);

  if (v15)
    v26 = v15;
  else
    v26 = v22;
  objc_msgSend(v19, "setPayloadAllowMusicVideos:", v26);

  if (v14)
    v27 = v14;
  else
    v27 = v22;
  objc_msgSend(v19, "setPayloadAllowSharedLibraries:", v27);

  objc_msgSend(v19, "updateServerHash");
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.music"));
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

+ (id)buildWithIdentifier:(id)a3 withAllowMusicService:(id)a4 withAllowRadioService:(id)a5 withAllowMusicArtistActivity:(id)a6 withAllowMusicVideos:(id)a7
{
  return +[CEMSystemMusicDeclaration buildWithIdentifier:withAllowMusicService:withAllowRadioService:withAllowMusicArtistActivity:withAllowMusicVideos:withAllowSharedLibraries:](CEMSystemMusicDeclaration, "buildWithIdentifier:withAllowMusicService:withAllowRadioService:withAllowMusicArtistActivity:withAllowMusicVideos:withAllowSharedLibraries:", a3, a4, a5, a6, a7, MEMORY[0x24BDBD1C8]);
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
  NSNumber *payloadAllowMusicService;
  NSNumber *v16;
  NSNumber *payloadAllowRadioService;
  NSNumber *v18;
  NSNumber *payloadAllowMusicArtistActivity;
  NSNumber *v20;
  NSNumber *payloadAllowMusicVideos;
  NSNumber *v22;
  NSNumber *payloadAllowSharedLibraries;
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

  +[CEMSystemMusicDeclaration allowedPayloadKeys](CEMSystemMusicDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowMusicService"), 0, MEMORY[0x24BDBD1C8], &v29);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadAllowMusicService = self->_payloadAllowMusicService;
  self->_payloadAllowMusicService = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowRadioService"), 0, MEMORY[0x24BDBD1C8], &v28);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadAllowRadioService = self->_payloadAllowRadioService;
    self->_payloadAllowRadioService = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowMusicArtistActivity"), 0, MEMORY[0x24BDBD1C8], &v27);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadAllowMusicArtistActivity = self->_payloadAllowMusicArtistActivity;
      self->_payloadAllowMusicArtistActivity = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowMusicVideos"), 0, MEMORY[0x24BDBD1C8], &v26);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadAllowMusicVideos = self->_payloadAllowMusicVideos;
        self->_payloadAllowMusicVideos = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowSharedMediaLibraries"), 0, MEMORY[0x24BDBD1C8], &v25);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadAllowSharedLibraries = self->_payloadAllowSharedLibraries;
          self->_payloadAllowSharedLibraries = v22;

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
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowMusicService"), self->_payloadAllowMusicService, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowRadioService"), self->_payloadAllowRadioService, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowMusicArtistActivity"), self->_payloadAllowMusicArtistActivity, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowMusicVideos"), self->_payloadAllowMusicVideos, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowSharedMediaLibraries"), self->_payloadAllowSharedLibraries, 0, v5);
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMSystemMusicDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowMusicService, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowRadioService, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowMusicArtistActivity, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadAllowMusicVideos, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowSharedLibraries, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSNumber)payloadAllowMusicService
{
  return self->_payloadAllowMusicService;
}

- (void)setPayloadAllowMusicService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowRadioService
{
  return self->_payloadAllowRadioService;
}

- (void)setPayloadAllowRadioService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowMusicArtistActivity
{
  return self->_payloadAllowMusicArtistActivity;
}

- (void)setPayloadAllowMusicArtistActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadAllowMusicVideos
{
  return self->_payloadAllowMusicVideos;
}

- (void)setPayloadAllowMusicVideos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadAllowSharedLibraries
{
  return self->_payloadAllowSharedLibraries;
}

- (void)setPayloadAllowSharedLibraries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowSharedLibraries, 0);
  objc_storeStrong((id *)&self->_payloadAllowMusicVideos, 0);
  objc_storeStrong((id *)&self->_payloadAllowMusicArtistActivity, 0);
  objc_storeStrong((id *)&self->_payloadAllowRadioService, 0);
  objc_storeStrong((id *)&self->_payloadAllowMusicService, 0);
}

@end
