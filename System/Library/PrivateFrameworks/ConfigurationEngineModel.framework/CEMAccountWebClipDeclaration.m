@implementation CEMAccountWebClipDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.account.webclip");
}

+ (id)profileType
{
  return CFSTR("com.apple.webClip.managed");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Precomposed");
  v6[1] = CFSTR("FullScreen");
  v6[2] = CFSTR("URL");
  v6[3] = CFSTR("IsRemovable");
  v6[4] = CFSTR("Label");
  v6[5] = CFSTR("Icon");
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
  -[CEMAccountWebClipDeclaration payloadIcon](self, "payloadIcon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CEMAssetReference referenceForIdentifier:assetschematype:](CEMAssetReference, "referenceForIdentifier:assetschematype:", v4, CFSTR("image"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withPrecomposed:(id)a4 withFullScreen:(id)a5 withURL:(id)a6 withIsRemovable:(id)a7 withLabel:(id)a8 withIcon:(id)a9
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
  id v27;

  v14 = a3;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setDeclarationType:", CFSTR("com.apple.configuration.account.webclip"));
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
  v24 = (void *)MEMORY[0x24BDBD1C0];
  if (v20)
    v25 = v20;
  else
    v25 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v21, "setPayloadPrecomposed:", v25);

  if (v19)
    v26 = v19;
  else
    v26 = v24;
  objc_msgSend(v21, "setPayloadFullScreen:", v26);

  objc_msgSend(v21, "setPayloadURL:", v18);
  if (v17)
    v27 = v17;
  else
    v27 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v21, "setPayloadIsRemovable:", v27);

  objc_msgSend(v21, "setPayloadLabel:", v16);
  objc_msgSend(v21, "setPayloadIcon:", v15);

  objc_msgSend(v21, "updateServerHash");
  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withURL:(id)a4 withLabel:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.account.webclip"));
  if (v7)
  {
    objc_msgSend(v10, "setDeclarationIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeclarationIdentifier:", v12);

  }
  objc_msgSend(v10, "setPayloadURL:", v9);

  objc_msgSend(v10, "setPayloadLabel:", v8);
  objc_msgSend(v10, "updateServerHash");

  return v10;
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
  NSNumber *payloadPrecomposed;
  NSNumber *v16;
  NSNumber *payloadFullScreen;
  NSString *v18;
  NSString *payloadURL;
  NSNumber *v20;
  NSNumber *payloadIsRemovable;
  NSString *v22;
  NSString *payloadLabel;
  NSString *v24;
  NSString *payloadIcon;
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

  +[CEMAccountWebClipDeclaration allowedPayloadKeys](CEMAccountWebClipDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v32 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Precomposed"), 0, MEMORY[0x24BDBD1C0], &v32);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  payloadPrecomposed = self->_payloadPrecomposed;
  self->_payloadPrecomposed = v13;

  if (!v14)
  {
    v31 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("FullScreen"), 0, MEMORY[0x24BDBD1C0], &v31);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    payloadFullScreen = self->_payloadFullScreen;
    self->_payloadFullScreen = v16;

    if (!v14)
    {
      v30 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("URL"), 1, 0, &v30);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      payloadURL = self->_payloadURL;
      self->_payloadURL = v18;

      if (!v14)
      {
        v29 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IsRemovable"), 0, MEMORY[0x24BDBD1C8], &v29);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        payloadIsRemovable = self->_payloadIsRemovable;
        self->_payloadIsRemovable = v20;

        if (!v14)
        {
          v28 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Label"), 1, 0, &v28);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          payloadLabel = self->_payloadLabel;
          self->_payloadLabel = v22;

          if (!v14)
          {
            v27 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Icon"), 0, 0, &v27);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v27;
            payloadIcon = self->_payloadIcon;
            self->_payloadIcon = v24;

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
  uint64_t v6;
  NSString *payloadIcon;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Precomposed"), self->_payloadPrecomposed, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("FullScreen"), self->_payloadFullScreen, 0, v6);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("URL"), self->_payloadURL, 1, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("IsRemovable"), self->_payloadIsRemovable, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Label"), self->_payloadLabel, 1, 0);
  payloadIcon = self->_payloadIcon;
  if (payloadIcon)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", self->_payloadIcon);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Icon"), payloadIcon, v8, CFSTR("<data>"), 0, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Icon"), 0, 0, CFSTR("<data>"), 0, &stru_24C63AAC0);
  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
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
  v18.super_class = (Class)CEMAccountWebClipDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadPrecomposed, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadFullScreen, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadURL, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadIsRemovable, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadLabel, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadIcon, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSNumber)payloadPrecomposed
{
  return self->_payloadPrecomposed;
}

- (void)setPayloadPrecomposed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadFullScreen
{
  return self->_payloadFullScreen;
}

- (void)setPayloadFullScreen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadURL
{
  return self->_payloadURL;
}

- (void)setPayloadURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadIsRemovable
{
  return self->_payloadIsRemovable;
}

- (void)setPayloadIsRemovable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadLabel
{
  return self->_payloadLabel;
}

- (void)setPayloadLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadIcon
{
  return self->_payloadIcon;
}

- (void)setPayloadIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIcon, 0);
  objc_storeStrong((id *)&self->_payloadLabel, 0);
  objc_storeStrong((id *)&self->_payloadIsRemovable, 0);
  objc_storeStrong((id *)&self->_payloadURL, 0);
  objc_storeStrong((id *)&self->_payloadFullScreen, 0);
  objc_storeStrong((id *)&self->_payloadPrecomposed, 0);
}

@end
