@implementation CEMSystemFontDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.system.font");
}

+ (id)profileType
{
  return CFSTR("com.apple.font");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Name");
  v6[1] = CFSTR("Font");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
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
  -[CEMSystemFontDeclaration payloadFont](self, "payloadFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CEMAssetReference referenceForIdentifier:assetschematype:](CEMAssetReference, "referenceForIdentifier:assetschematype:", v4, CFSTR("font"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withName:(id)a4 withFont:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;

  v7 = a3;
  v8 = a5;
  v9 = (__CFString *)a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.system.font"));
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
  if (v9)
    v13 = v9;
  else
    v13 = &stru_24C63AAC0;
  objc_msgSend(v10, "setPayloadName:", v13);

  objc_msgSend(v10, "setPayloadFont:", v8);
  objc_msgSend(v10, "updateServerHash");

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withFont:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.system.font"));
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
  objc_msgSend(v7, "setPayloadFont:", v6);

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
  NSString *v13;
  id v14;
  NSString *payloadName;
  NSString *v16;
  NSString *payloadFont;
  id v19;
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemFontDeclaration allowedPayloadKeys](CEMSystemFontDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v20 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Name"), 0, &stru_24C63AAC0, &v20);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  payloadName = self->_payloadName;
  self->_payloadName = v13;

  if (!v14)
  {
    v19 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Font"), 1, 0, &v19);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    payloadFont = self->_payloadFont;
    self->_payloadFont = v16;

  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  NSString *payloadFont;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Name"), self->_payloadName, 0, &stru_24C63AAC0);
  payloadFont = self->_payloadFont;
  if (payloadFont)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", self->_payloadFont);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Font"), payloadFont, v7, CFSTR("<data>"), 1, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Font"), 0, 0, CFSTR("<data>"), 1, &stru_24C63AAC0);
  }
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CEMSystemFontDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadName, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadFont, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadFont
{
  return self->_payloadFont;
}

- (void)setPayloadFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFont, 0);
  objc_storeStrong((id *)&self->_payloadName, 0);
}

@end
