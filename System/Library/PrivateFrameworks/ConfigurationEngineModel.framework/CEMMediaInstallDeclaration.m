@implementation CEMMediaInstallDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.media.install");
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
  v6[0] = CFSTR("Media");
  v6[1] = CFSTR("Mandatory");
  v6[2] = CFSTR("InstallWhenActivated");
  v6[3] = CFSTR("RemoveWhenDeactivated");
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
  -[CEMMediaInstallDeclaration payloadMedia](self, "payloadMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CEMAssetReference referenceForIdentifier:assetschematype:](CEMAssetReference, "referenceForIdentifier:assetschematype:", v4, CFSTR("book"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withMedia:(id)a4 withMandatory:(id)a5 withInstallWhenActivated:(id)a6 withRemoveWhenDeactivated:(id)a7
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
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.media.install"));
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
  objc_msgSend(v16, "setPayloadMedia:", v15);

  objc_msgSend(v16, "setPayloadMandatory:", v14);
  v19 = (void *)MEMORY[0x24BDBD1C8];
  if (v13)
    v20 = v13;
  else
    v20 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v16, "setPayloadInstallWhenActivated:", v20);

  if (v12)
    v21 = v12;
  else
    v21 = v19;
  objc_msgSend(v16, "setPayloadRemoveWhenDeactivated:", v21);

  objc_msgSend(v16, "updateServerHash");
  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withMedia:(id)a4 withMandatory:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.media.install"));
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
  objc_msgSend(v10, "setPayloadMedia:", v9);

  objc_msgSend(v10, "setPayloadMandatory:", v8);
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
  NSString *v13;
  id v14;
  NSString *payloadMedia;
  NSNumber *v16;
  NSNumber *payloadMandatory;
  NSNumber *v18;
  NSNumber *payloadInstallWhenActivated;
  NSNumber *v20;
  NSNumber *payloadRemoveWhenDeactivated;
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

  +[CEMMediaInstallDeclaration allowedPayloadKeys](CEMMediaInstallDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Media"), 1, 0, &v26);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadMedia = self->_payloadMedia;
  self->_payloadMedia = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Mandatory"), 1, 0, &v25);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadMandatory = self->_payloadMandatory;
    self->_payloadMandatory = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("InstallWhenActivated"), 0, MEMORY[0x24BDBD1C8], &v24);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadInstallWhenActivated = self->_payloadInstallWhenActivated;
      self->_payloadInstallWhenActivated = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RemoveWhenDeactivated"), 0, MEMORY[0x24BDBD1C8], &v23);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadRemoveWhenDeactivated = self->_payloadRemoveWhenDeactivated;
        self->_payloadRemoveWhenDeactivated = v20;

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
  NSString *payloadMedia;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadMedia = self->_payloadMedia;
  if (payloadMedia)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", self->_payloadMedia);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Media"), payloadMedia, v7, &stru_24C63AAC0);

  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, CFSTR("Media"), 0, 0, &stru_24C63AAC0);
  }
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Mandatory"), self->_payloadMandatory, 1, 0);
  v8 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("InstallWhenActivated"), self->_payloadInstallWhenActivated, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("RemoveWhenDeactivated"), self->_payloadRemoveWhenDeactivated, 0, v8);
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMMediaInstallDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadMedia, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadMandatory, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadInstallWhenActivated, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadRemoveWhenDeactivated, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSString)payloadMedia
{
  return self->_payloadMedia;
}

- (void)setPayloadMedia:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadMandatory
{
  return self->_payloadMandatory;
}

- (void)setPayloadMandatory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadInstallWhenActivated
{
  return self->_payloadInstallWhenActivated;
}

- (void)setPayloadInstallWhenActivated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadRemoveWhenDeactivated
{
  return self->_payloadRemoveWhenDeactivated;
}

- (void)setPayloadRemoveWhenDeactivated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRemoveWhenDeactivated, 0);
  objc_storeStrong((id *)&self->_payloadInstallWhenActivated, 0);
  objc_storeStrong((id *)&self->_payloadMandatory, 0);
  objc_storeStrong((id *)&self->_payloadMedia, 0);
}

@end
