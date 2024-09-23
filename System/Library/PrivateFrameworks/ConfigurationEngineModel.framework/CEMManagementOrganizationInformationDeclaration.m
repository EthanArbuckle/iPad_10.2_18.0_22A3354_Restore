@implementation CEMManagementOrganizationInformationDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.management.organization");
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
  v6[0] = CFSTR("OrganizationName");
  v6[1] = CFSTR("OrganizationAddress");
  v6[2] = CFSTR("OrganizationPhone");
  v6[3] = CFSTR("OrganizationEmail");
  v6[4] = CFSTR("OrganizationMagic");
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withOrganizationName:(id)a4 withOrganizationAddress:(id)a5 withOrganizationPhone:(id)a6 withOrganizationEmail:(id)a7 withOrganizationMagic:(id)a8
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
  objc_msgSend(v19, "setDeclarationType:", CFSTR("com.apple.configuration.management.organization"));
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
  objc_msgSend(v19, "setPayloadOrganizationName:", v18);

  objc_msgSend(v19, "setPayloadOrganizationAddress:", v17);
  objc_msgSend(v19, "setPayloadOrganizationPhone:", v16);

  objc_msgSend(v19, "setPayloadOrganizationEmail:", v15);
  objc_msgSend(v19, "setPayloadOrganizationMagic:", v14);

  objc_msgSend(v19, "updateServerHash");
  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withOrganizationName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.management.organization"));
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
  objc_msgSend(v7, "setPayloadOrganizationName:", v6);

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
  NSString *payloadOrganizationName;
  NSString *v16;
  NSString *payloadOrganizationAddress;
  NSString *v18;
  NSString *payloadOrganizationPhone;
  NSString *v20;
  NSString *payloadOrganizationEmail;
  NSString *v22;
  NSString *payloadOrganizationMagic;
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

  +[CEMManagementOrganizationInformationDeclaration allowedPayloadKeys](CEMManagementOrganizationInformationDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OrganizationName"), 1, 0, &v29);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadOrganizationName = self->_payloadOrganizationName;
  self->_payloadOrganizationName = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OrganizationAddress"), 0, 0, &v28);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadOrganizationAddress = self->_payloadOrganizationAddress;
    self->_payloadOrganizationAddress = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OrganizationPhone"), 0, 0, &v27);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadOrganizationPhone = self->_payloadOrganizationPhone;
      self->_payloadOrganizationPhone = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OrganizationEmail"), 0, 0, &v26);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadOrganizationEmail = self->_payloadOrganizationEmail;
        self->_payloadOrganizationEmail = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("OrganizationMagic"), 0, 0, &v25);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadOrganizationMagic = self->_payloadOrganizationMagic;
          self->_payloadOrganizationMagic = v22;

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
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("OrganizationName"), self->_payloadOrganizationName, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("OrganizationAddress"), self->_payloadOrganizationAddress, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("OrganizationPhone"), self->_payloadOrganizationPhone, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("OrganizationEmail"), self->_payloadOrganizationEmail, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("OrganizationMagic"), self->_payloadOrganizationMagic, 0, 0);
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
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMManagementOrganizationInformationDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadOrganizationName, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadOrganizationAddress, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadOrganizationPhone, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSString copy](self->_payloadOrganizationEmail, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadOrganizationMagic, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSString)payloadOrganizationName
{
  return self->_payloadOrganizationName;
}

- (void)setPayloadOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadOrganizationAddress
{
  return self->_payloadOrganizationAddress;
}

- (void)setPayloadOrganizationAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadOrganizationPhone
{
  return self->_payloadOrganizationPhone;
}

- (void)setPayloadOrganizationPhone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadOrganizationEmail
{
  return self->_payloadOrganizationEmail;
}

- (void)setPayloadOrganizationEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadOrganizationMagic
{
  return self->_payloadOrganizationMagic;
}

- (void)setPayloadOrganizationMagic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadOrganizationMagic, 0);
  objc_storeStrong((id *)&self->_payloadOrganizationEmail, 0);
  objc_storeStrong((id *)&self->_payloadOrganizationPhone, 0);
  objc_storeStrong((id *)&self->_payloadOrganizationAddress, 0);
  objc_storeStrong((id *)&self->_payloadOrganizationName, 0);
}

@end
