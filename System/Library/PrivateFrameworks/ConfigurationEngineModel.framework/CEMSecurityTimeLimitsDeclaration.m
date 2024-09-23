@implementation CEMSecurityTimeLimitsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.security.timelimits");
}

+ (id)profileType
{
  return CFSTR("com.apple.familycontrols.timelimits.v2");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("familyControlsEnabled");
  v6[1] = CFSTR("time-limits");
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

+ (id)buildWithIdentifier:(id)a3 withFamilyControlsEnabled:(id)a4 withTimeLimits:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.security.timelimits"));
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
  objc_msgSend(v10, "setPayloadFamilyControlsEnabled:", v9);

  objc_msgSend(v10, "setPayloadTimeLimits:", v8);
  objc_msgSend(v10, "updateServerHash");

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withFamilyControlsEnabled:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.security.timelimits"));
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
  objc_msgSend(v7, "setPayloadFamilyControlsEnabled:", v6);

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
  NSNumber *payloadFamilyControlsEnabled;
  CEMSecurityTimeLimitsDeclaration_TimeLimits *v16;
  CEMSecurityTimeLimitsDeclaration_TimeLimits *payloadTimeLimits;
  id v19;
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSecurityTimeLimitsDeclaration allowedPayloadKeys](CEMSecurityTimeLimitsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v20 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("familyControlsEnabled"), 1, 0, &v20);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  payloadFamilyControlsEnabled = self->_payloadFamilyControlsEnabled;
  self->_payloadFamilyControlsEnabled = v13;

  if (!v14)
  {
    v19 = 0;
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("time-limits"), objc_opt_class(), 0, 0, &v19);
    v16 = (CEMSecurityTimeLimitsDeclaration_TimeLimits *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    payloadTimeLimits = self->_payloadTimeLimits;
    self->_payloadTimeLimits = v16;

  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  CEMSecurityTimeLimitsDeclaration_TimeLimits *payloadTimeLimits;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("familyControlsEnabled"), self->_payloadFamilyControlsEnabled, 1, 0);
  payloadTimeLimits = self->_payloadTimeLimits;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__CEMSecurityTimeLimitsDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_24C638560;
  v11 = v4;
  v7 = v4;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("time-limits"), payloadTimeLimits, v10, 0, 0);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

uint64_t __71__CEMSecurityTimeLimitsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CEMSecurityTimeLimitsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadFamilyControlsEnabled, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[CEMSecurityTimeLimitsDeclaration_TimeLimits copy](self->_payloadTimeLimits, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSNumber)payloadFamilyControlsEnabled
{
  return self->_payloadFamilyControlsEnabled;
}

- (void)setPayloadFamilyControlsEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CEMSecurityTimeLimitsDeclaration_TimeLimits)payloadTimeLimits
{
  return self->_payloadTimeLimits;
}

- (void)setPayloadTimeLimits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTimeLimits, 0);
  objc_storeStrong((id *)&self->_payloadFamilyControlsEnabled, 0);
}

uint64_t __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

@end
