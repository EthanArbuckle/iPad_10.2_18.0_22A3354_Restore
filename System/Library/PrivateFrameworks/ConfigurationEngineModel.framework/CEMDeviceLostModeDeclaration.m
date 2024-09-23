@implementation CEMDeviceLostModeDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.device.lostmode");
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
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Enable");
  v6[1] = CFSTR("Message");
  v6[2] = CFSTR("PhoneNumber");
  v6[3] = CFSTR("Footnote");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
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
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withEnable:(id)a4 withMessage:(id)a5 withPhoneNumber:(id)a6 withFootnote:(id)a7
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
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.device.lostmode"));
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
  objc_msgSend(v16, "setPayloadEnable:", v15);

  objc_msgSend(v16, "setPayloadMessage:", v14);
  objc_msgSend(v16, "setPayloadPhoneNumber:", v13);

  objc_msgSend(v16, "setPayloadFootnote:", v12);
  objc_msgSend(v16, "updateServerHash");

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEnable:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.device.lostmode"));
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
  objc_msgSend(v7, "setPayloadEnable:", v6);

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
  NSNumber *payloadEnable;
  NSString *v16;
  NSString *payloadMessage;
  NSString *v18;
  NSString *payloadPhoneNumber;
  NSString *v20;
  NSString *payloadFootnote;
  id v23;
  id v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMDeviceLostModeDeclaration allowedPayloadKeys](CEMDeviceLostModeDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Enable"), 1, 0, &v26);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadEnable = self->_payloadEnable;
  self->_payloadEnable = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Message"), 0, 0, &v25);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadMessage = self->_payloadMessage;
    self->_payloadMessage = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PhoneNumber"), 0, 0, &v24);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadPhoneNumber = self->_payloadPhoneNumber;
      self->_payloadPhoneNumber = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Footnote"), 0, 0, &v23);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadFootnote = self->_payloadFootnote;
        self->_payloadFootnote = v20;

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
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Enable"), self->_payloadEnable, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Message"), self->_payloadMessage, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("PhoneNumber"), self->_payloadPhoneNumber, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Footnote"), self->_payloadFootnote, 0, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMDeviceLostModeDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadEnable, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadMessage, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadPhoneNumber, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSString copy](self->_payloadFootnote, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSNumber)payloadEnable
{
  return self->_payloadEnable;
}

- (void)setPayloadEnable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadMessage
{
  return self->_payloadMessage;
}

- (void)setPayloadMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadPhoneNumber
{
  return self->_payloadPhoneNumber;
}

- (void)setPayloadPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadFootnote
{
  return self->_payloadFootnote;
}

- (void)setPayloadFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadFootnote, 0);
  objc_storeStrong((id *)&self->_payloadPhoneNumber, 0);
  objc_storeStrong((id *)&self->_payloadMessage, 0);
  objc_storeStrong((id *)&self->_payloadEnable, 0);
}

@end
