@implementation CEMSecurityFirewallDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.security.firewall");
}

+ (id)profileType
{
  return CFSTR("com.apple.security.firewall");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("EnableFirewall");
  v6[1] = CFSTR("BlockAllIncoming");
  v6[2] = CFSTR("EnableStealthMode");
  v6[3] = CFSTR("Applications");
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
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withEnableFirewall:(id)a4 withBlockAllIncoming:(id)a5 withEnableStealthMode:(id)a6 withApplications:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.security.firewall"));
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
  objc_msgSend(v16, "setPayloadEnableFirewall:", v15);

  v19 = (void *)MEMORY[0x24BDBD1C0];
  if (v14)
    v20 = v14;
  else
    v20 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v16, "setPayloadBlockAllIncoming:", v20);

  if (v13)
    v21 = v13;
  else
    v21 = v19;
  objc_msgSend(v16, "setPayloadEnableStealthMode:", v21);

  objc_msgSend(v16, "setPayloadApplications:", v12);
  objc_msgSend(v16, "updateServerHash");

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEnableFirewall:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.security.firewall"));
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
  objc_msgSend(v7, "setPayloadEnableFirewall:", v6);

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
  NSNumber *payloadEnableFirewall;
  NSNumber *v16;
  NSNumber *payloadBlockAllIncoming;
  NSNumber *v18;
  NSNumber *payloadEnableStealthMode;
  NSArray *v20;
  NSArray *payloadApplications;
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

  +[CEMSecurityFirewallDeclaration allowedPayloadKeys](CEMSecurityFirewallDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableFirewall"), 1, 0, &v26);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadEnableFirewall = self->_payloadEnableFirewall;
  self->_payloadEnableFirewall = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BlockAllIncoming"), 0, MEMORY[0x24BDBD1C0], &v25);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadBlockAllIncoming = self->_payloadBlockAllIncoming;
    self->_payloadBlockAllIncoming = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EnableStealthMode"), 0, MEMORY[0x24BDBD1C0], &v24);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadEnableStealthMode = self->_payloadEnableStealthMode;
      self->_payloadEnableStealthMode = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("Applications"), objc_opt_class(), 0, 0, 0, &v23);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadApplications = self->_payloadApplications;
        self->_payloadApplications = v20;

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
  NSArray *payloadApplications;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EnableFirewall"), self->_payloadEnableFirewall, 1, 0);
  v6 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("BlockAllIncoming"), self->_payloadBlockAllIncoming, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("EnableStealthMode"), self->_payloadEnableStealthMode, 0, v6);
  payloadApplications = self->_payloadApplications;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__CEMSecurityFirewallDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v11[3] = &unk_24C639FE8;
  v12 = v4;
  v8 = v4;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Applications"), payloadApplications, v11, 0, 0);
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

uint64_t __69__CEMSecurityFirewallDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
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
  v14.super_class = (Class)CEMSecurityFirewallDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadEnableFirewall, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadBlockAllIncoming, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadEnableStealthMode, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSArray copy](self->_payloadApplications, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSNumber)payloadEnableFirewall
{
  return self->_payloadEnableFirewall;
}

- (void)setPayloadEnableFirewall:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadBlockAllIncoming
{
  return self->_payloadBlockAllIncoming;
}

- (void)setPayloadBlockAllIncoming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadEnableStealthMode
{
  return self->_payloadEnableStealthMode;
}

- (void)setPayloadEnableStealthMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)payloadApplications
{
  return self->_payloadApplications;
}

- (void)setPayloadApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadApplications, 0);
  objc_storeStrong((id *)&self->_payloadEnableStealthMode, 0);
  objc_storeStrong((id *)&self->_payloadBlockAllIncoming, 0);
  objc_storeStrong((id *)&self->_payloadEnableFirewall, 0);
}

@end
