@implementation CEMMediaSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.media.settings");
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
  v6[0] = CFSTR("allowBookstore");
  v6[1] = CFSTR("allowBookstoreErotica");
  v6[2] = CFSTR("allowEnterpriseBookBackup");
  v6[3] = CFSTR("allowEnterpriseBookMetadataSync");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
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
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowBookstore");
  v6[1] = CFSTR("allowBookstoreErotica");
  v6[2] = CFSTR("allowEnterpriseBookBackup");
  v6[3] = CFSTR("allowEnterpriseBookMetadataSync");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
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

+ (id)buildWithIdentifier:(id)a3 withAllowBookstore:(id)a4 withAllowBookstoreErotica:(id)a5 withAllowEnterpriseBookBackup:(id)a6 withAllowEnterpriseBookMetadataSync:(id)a7
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
  id v22;
  id v23;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setDeclarationType:", CFSTR("com.apple.configuration.media.settings"));
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
  v19 = (void *)MEMORY[0x24BDBD1C8];
  if (v15)
    v20 = v15;
  else
    v20 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v16, "setPayloadAllowBookstore:", v20);

  if (v14)
    v21 = v14;
  else
    v21 = v19;
  objc_msgSend(v16, "setPayloadAllowBookstoreErotica:", v21);

  if (v13)
    v22 = v13;
  else
    v22 = v19;
  objc_msgSend(v16, "setPayloadAllowEnterpriseBookBackup:", v22);

  if (v12)
    v23 = v12;
  else
    v23 = v19;
  objc_msgSend(v16, "setPayloadAllowEnterpriseBookMetadataSync:", v23);

  objc_msgSend(v16, "updateServerHash");
  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.media.settings"));
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
  NSNumber *v13;
  id v14;
  NSNumber *payloadAllowBookstore;
  NSNumber *v16;
  NSNumber *payloadAllowBookstoreErotica;
  NSNumber *v18;
  NSNumber *payloadAllowEnterpriseBookBackup;
  NSNumber *v20;
  NSNumber *payloadAllowEnterpriseBookMetadataSync;
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

  +[CEMMediaSettingsDeclaration allowedPayloadKeys](CEMMediaSettingsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowBookstore"), 0, MEMORY[0x24BDBD1C8], &v26);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadAllowBookstore = self->_payloadAllowBookstore;
  self->_payloadAllowBookstore = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowBookstoreErotica"), 0, MEMORY[0x24BDBD1C8], &v25);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadAllowBookstoreErotica = self->_payloadAllowBookstoreErotica;
    self->_payloadAllowBookstoreErotica = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowEnterpriseBookBackup"), 0, MEMORY[0x24BDBD1C8], &v24);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadAllowEnterpriseBookBackup = self->_payloadAllowEnterpriseBookBackup;
      self->_payloadAllowEnterpriseBookBackup = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowEnterpriseBookMetadataSync"), 0, MEMORY[0x24BDBD1C8], &v23);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadAllowEnterpriseBookMetadataSync = self->_payloadAllowEnterpriseBookMetadataSync;
        self->_payloadAllowEnterpriseBookMetadataSync = v20;

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
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowBookstore"), self->_payloadAllowBookstore, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowBookstoreErotica"), self->_payloadAllowBookstoreErotica, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowEnterpriseBookBackup"), self->_payloadAllowEnterpriseBookBackup, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowEnterpriseBookMetadataSync"), self->_payloadAllowEnterpriseBookMetadataSync, 0, v5);
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMMediaSettingsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowBookstore, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAllowBookstoreErotica, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowEnterpriseBookBackup, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadAllowEnterpriseBookMetadataSync, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  return v4;
}

- (NSNumber)payloadAllowBookstore
{
  return self->_payloadAllowBookstore;
}

- (void)setPayloadAllowBookstore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAllowBookstoreErotica
{
  return self->_payloadAllowBookstoreErotica;
}

- (void)setPayloadAllowBookstoreErotica:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowEnterpriseBookBackup
{
  return self->_payloadAllowEnterpriseBookBackup;
}

- (void)setPayloadAllowEnterpriseBookBackup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadAllowEnterpriseBookMetadataSync
{
  return self->_payloadAllowEnterpriseBookMetadataSync;
}

- (void)setPayloadAllowEnterpriseBookMetadataSync:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowEnterpriseBookMetadataSync, 0);
  objc_storeStrong((id *)&self->_payloadAllowEnterpriseBookBackup, 0);
  objc_storeStrong((id *)&self->_payloadAllowBookstoreErotica, 0);
  objc_storeStrong((id *)&self->_payloadAllowBookstore, 0);
}

@end
