@implementation CEMApplicationControlDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.application.control");
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
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("InstallSchedule");
  v6[1] = CFSTR("UpdatePolicy");
  v6[2] = CFSTR("UpdateSchedule");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withInstallSchedule:(id)a4 withUpdatePolicy:(id)a5 withUpdateSchedule:(id)a6
{
  id v9;
  id v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  v9 = a3;
  v10 = a6;
  v11 = (__CFString *)a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.configuration.application.control"));
  if (v9)
  {
    objc_msgSend(v13, "setDeclarationIdentifier:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDeclarationIdentifier:", v15);

  }
  objc_msgSend(v13, "setPayloadInstallSchedule:", v12);

  if (v11)
    v16 = v11;
  else
    v16 = CFSTR("Default");
  objc_msgSend(v13, "setPayloadUpdatePolicy:", v16);

  objc_msgSend(v13, "setPayloadUpdateSchedule:", v10);
  objc_msgSend(v13, "updateServerHash");

  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.application.control"));
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
  CEMApplicationControlDeclaration_InstallSchedule *v13;
  id v14;
  CEMApplicationControlDeclaration_InstallSchedule *payloadInstallSchedule;
  NSString *v16;
  NSString *payloadUpdatePolicy;
  CEMApplicationControlDeclaration_UpdateSchedule *v18;
  CEMApplicationControlDeclaration_UpdateSchedule *payloadUpdateSchedule;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationControlDeclaration allowedPayloadKeys](CEMApplicationControlDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("InstallSchedule"), objc_opt_class(), 0, 0, &v23);
  v13 = (CEMApplicationControlDeclaration_InstallSchedule *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadInstallSchedule = self->_payloadInstallSchedule;
  self->_payloadInstallSchedule = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("UpdatePolicy"), 0, CFSTR("Default"), &v22);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadUpdatePolicy = self->_payloadUpdatePolicy;
    self->_payloadUpdatePolicy = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("UpdateSchedule"), objc_opt_class(), 0, 0, &v21);
      v18 = (CEMApplicationControlDeclaration_UpdateSchedule *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadUpdateSchedule = self->_payloadUpdateSchedule;
      self->_payloadUpdateSchedule = v18;

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
  CEMApplicationControlDeclaration_InstallSchedule *payloadInstallSchedule;
  uint64_t v7;
  id v8;
  CEMApplicationControlDeclaration_UpdateSchedule *payloadUpdateSchedule;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadInstallSchedule = self->_payloadInstallSchedule;
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __71__CEMApplicationControlDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_24C638560;
  v8 = v4;
  v19 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("InstallSchedule"), payloadInstallSchedule, v18, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("UpdatePolicy"), self->_payloadUpdatePolicy, 0, CFSTR("Default"));
  payloadUpdateSchedule = self->_payloadUpdateSchedule;
  v13 = v7;
  v14 = 3221225472;
  v15 = __71__CEMApplicationControlDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v16 = &unk_24C638560;
  v17 = v8;
  v10 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("UpdateSchedule"), payloadUpdateSchedule, &v13, 0, 0);
  v11 = (void *)objc_msgSend(v5, "copy", v13, v14, v15, v16);

  return v11;
}

uint64_t __71__CEMApplicationControlDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__CEMApplicationControlDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMApplicationControlDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[CEMApplicationControlDeclaration_InstallSchedule copy](self->_payloadInstallSchedule, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadUpdatePolicy, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[CEMApplicationControlDeclaration_UpdateSchedule copy](self->_payloadUpdateSchedule, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (CEMApplicationControlDeclaration_InstallSchedule)payloadInstallSchedule
{
  return self->_payloadInstallSchedule;
}

- (void)setPayloadInstallSchedule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadUpdatePolicy
{
  return self->_payloadUpdatePolicy;
}

- (void)setPayloadUpdatePolicy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CEMApplicationControlDeclaration_UpdateSchedule)payloadUpdateSchedule
{
  return self->_payloadUpdateSchedule;
}

- (void)setPayloadUpdateSchedule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUpdateSchedule, 0);
  objc_storeStrong((id *)&self->_payloadUpdatePolicy, 0);
  objc_storeStrong((id *)&self->_payloadInstallSchedule, 0);
}

@end
