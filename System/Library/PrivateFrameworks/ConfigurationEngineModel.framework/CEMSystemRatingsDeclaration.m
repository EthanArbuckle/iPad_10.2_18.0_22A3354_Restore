@implementation CEMSystemRatingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.ratings");
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
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ratingRegion");
  v6[1] = CFSTR("ratingApps");
  v6[2] = CFSTR("ratingMovies");
  v6[3] = CFSTR("ratingTVShows");
  v6[4] = CFSTR("allowExplicitContent");
  v6[5] = CFSTR("allowShowingUndownloadedTV");
  v6[6] = CFSTR("allowShowingUndownloadedMovies");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
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
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ratingRegion");
  v6[1] = CFSTR("ratingApps");
  v6[2] = CFSTR("ratingMovies");
  v6[3] = CFSTR("ratingTVShows");
  v6[4] = CFSTR("allowExplicitContent");
  v6[5] = CFSTR("allowShowingUndownloadedTV");
  v6[6] = CFSTR("allowShowingUndownloadedMovies");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
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

+ (id)buildWithIdentifier:(id)a3 withRatingRegion:(id)a4 withRatingApps:(id)a5 withRatingMovies:(id)a6 withRatingTVShows:(id)a7 withAllowExplicitContent:(id)a8 withAllowShowingUndownloadedTV:(id)a9 withAllowShowingUndownloadedMovies:(id)a10
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v33;

  v15 = a3;
  v33 = a10;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setDeclarationType:", CFSTR("com.apple.configuration.system.ratings"));
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
  objc_msgSend(v22, "setPayloadRatingRegion:", v21);

  if (v20)
    v25 = v20;
  else
    v25 = &unk_24C69CEA8;
  objc_msgSend(v22, "setPayloadRatingApps:", v25);

  if (v19)
    v26 = v19;
  else
    v26 = &unk_24C69CEA8;
  objc_msgSend(v22, "setPayloadRatingMovies:", v26);

  if (v18)
    v27 = v18;
  else
    v27 = &unk_24C69CEA8;
  objc_msgSend(v22, "setPayloadRatingTVShows:", v27);

  v28 = (void *)MEMORY[0x24BDBD1C8];
  if (v17)
    v29 = v17;
  else
    v29 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v22, "setPayloadAllowExplicitContent:", v29);

  if (v16)
    v30 = v16;
  else
    v30 = v28;
  objc_msgSend(v22, "setPayloadAllowShowingUndownloadedTV:", v30);

  if (v33)
    v31 = v33;
  else
    v31 = v28;
  objc_msgSend(v22, "setPayloadAllowShowingUndownloadedMovies:", v31);

  objc_msgSend(v22, "updateServerHash");
  return v22;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.system.ratings"));
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
  NSString *payloadRatingRegion;
  NSNumber *v16;
  NSNumber *payloadRatingApps;
  NSNumber *v18;
  NSNumber *payloadRatingMovies;
  NSNumber *v20;
  NSNumber *payloadRatingTVShows;
  NSNumber *v22;
  NSNumber *payloadAllowExplicitContent;
  NSNumber *v24;
  NSNumber *payloadAllowShowingUndownloadedTV;
  NSNumber *v26;
  NSNumber *payloadAllowShowingUndownloadedMovies;
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

  +[CEMSystemRatingsDeclaration allowedPayloadKeys](CEMSystemRatingsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v35 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ratingRegion"), 0, 0, &v35);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v35;
  payloadRatingRegion = self->_payloadRatingRegion;
  self->_payloadRatingRegion = v13;

  if (!v14)
  {
    v34 = 0;
    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ratingApps"), 0, &unk_24C69CEA8, &v34);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v34;
    payloadRatingApps = self->_payloadRatingApps;
    self->_payloadRatingApps = v16;

    if (!v14)
    {
      v33 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ratingMovies"), 0, &unk_24C69CEA8, &v33);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v33;
      payloadRatingMovies = self->_payloadRatingMovies;
      self->_payloadRatingMovies = v18;

      if (!v14)
      {
        v32 = 0;
        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ratingTVShows"), 0, &unk_24C69CEA8, &v32);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v32;
        payloadRatingTVShows = self->_payloadRatingTVShows;
        self->_payloadRatingTVShows = v20;

        if (!v14)
        {
          v31 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowExplicitContent"), 0, MEMORY[0x24BDBD1C8], &v31);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v31;
          payloadAllowExplicitContent = self->_payloadAllowExplicitContent;
          self->_payloadAllowExplicitContent = v22;

          if (!v14)
          {
            v30 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowShowingUndownloadedTV"), 0, MEMORY[0x24BDBD1C8], &v30);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v30;
            payloadAllowShowingUndownloadedTV = self->_payloadAllowShowingUndownloadedTV;
            self->_payloadAllowShowingUndownloadedTV = v24;

            if (!v14)
            {
              v29 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowShowingUndownloadedMovies"), 0, MEMORY[0x24BDBD1C8], &v29);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v29;
              payloadAllowShowingUndownloadedMovies = self->_payloadAllowShowingUndownloadedMovies;
              self->_payloadAllowShowingUndownloadedMovies = v26;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ratingRegion"), self->_payloadRatingRegion, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ratingApps"), self->_payloadRatingApps, 0, &unk_24C69CEA8);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ratingMovies"), self->_payloadRatingMovies, 0, &unk_24C69CEA8);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ratingTVShows"), self->_payloadRatingTVShows, 0, &unk_24C69CEA8);
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowExplicitContent"), self->_payloadAllowExplicitContent, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowShowingUndownloadedTV"), self->_payloadAllowShowingUndownloadedTV, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowShowingUndownloadedMovies"), self->_payloadAllowShowingUndownloadedMovies, 0, v5);
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CEMSystemRatingsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v20, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadRatingRegion, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadRatingApps, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadRatingMovies, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadRatingTVShows, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowExplicitContent, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadAllowShowingUndownloadedTV, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadAllowShowingUndownloadedMovies, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  return v4;
}

- (NSString)payloadRatingRegion
{
  return self->_payloadRatingRegion;
}

- (void)setPayloadRatingRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadRatingApps
{
  return self->_payloadRatingApps;
}

- (void)setPayloadRatingApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadRatingMovies
{
  return self->_payloadRatingMovies;
}

- (void)setPayloadRatingMovies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadRatingTVShows
{
  return self->_payloadRatingTVShows;
}

- (void)setPayloadRatingTVShows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadAllowExplicitContent
{
  return self->_payloadAllowExplicitContent;
}

- (void)setPayloadAllowExplicitContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadAllowShowingUndownloadedTV
{
  return self->_payloadAllowShowingUndownloadedTV;
}

- (void)setPayloadAllowShowingUndownloadedTV:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadAllowShowingUndownloadedMovies
{
  return self->_payloadAllowShowingUndownloadedMovies;
}

- (void)setPayloadAllowShowingUndownloadedMovies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowShowingUndownloadedMovies, 0);
  objc_storeStrong((id *)&self->_payloadAllowShowingUndownloadedTV, 0);
  objc_storeStrong((id *)&self->_payloadAllowExplicitContent, 0);
  objc_storeStrong((id *)&self->_payloadRatingTVShows, 0);
  objc_storeStrong((id *)&self->_payloadRatingMovies, 0);
  objc_storeStrong((id *)&self->_payloadRatingApps, 0);
  objc_storeStrong((id *)&self->_payloadRatingRegion, 0);
}

@end
