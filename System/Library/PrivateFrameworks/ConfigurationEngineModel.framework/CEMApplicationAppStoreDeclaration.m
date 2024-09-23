@implementation CEMApplicationAppStoreDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.asset.application.appstore");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Descriptor");
  v6[1] = CFSTR("BundleIdentifier");
  v6[2] = CFSTR("iTunesStoreID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withITunesStoreID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.asset.application.appstore"));
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
  objc_msgSend(v13, "setPayloadDescriptor:", v12);

  objc_msgSend(v13, "setPayloadBundleIdentifier:", v11);
  objc_msgSend(v13, "setPayloadITunesStoreID:", v10);

  objc_msgSend(v13, "updateServerHash");
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withBundleIdentifier:(id)a5 withITunesStoreID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.asset.application.appstore"));
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
  objc_msgSend(v13, "setPayloadDescriptor:", v12);

  objc_msgSend(v13, "setPayloadBundleIdentifier:", v11);
  objc_msgSend(v13, "setPayloadITunesStoreID:", v10);

  objc_msgSend(v13, "updateServerHash");
  return v13;
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
  CEMAssetBaseDescriptor *v13;
  id v14;
  CEMAssetBaseDescriptor *payloadDescriptor;
  NSString *v16;
  NSString *payloadBundleIdentifier;
  NSNumber *v18;
  NSNumber *payloadITunesStoreID;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationAppStoreDeclaration allowedPayloadKeys](CEMApplicationAppStoreDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("Descriptor"), objc_opt_class(), 1, 0, &v23);
  v13 = (CEMAssetBaseDescriptor *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadDescriptor = self->_payloadDescriptor;
  self->_payloadDescriptor = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("BundleIdentifier"), 1, 0, &v22);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadBundleIdentifier = self->_payloadBundleIdentifier;
    self->_payloadBundleIdentifier = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("iTunesStoreID"), 1, 0, &v21);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadITunesStoreID = self->_payloadITunesStoreID;
      self->_payloadITunesStoreID = v18;

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
  CEMAssetBaseDescriptor *payloadDescriptor;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadDescriptor = self->_payloadDescriptor;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__CEMApplicationAppStoreDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_24C638560;
  v11 = v4;
  v7 = v4;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Descriptor"), payloadDescriptor, v10, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("BundleIdentifier"), self->_payloadBundleIdentifier, 1, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("iTunesStoreID"), self->_payloadITunesStoreID, 1, 0);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

uint64_t __72__CEMApplicationAppStoreDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
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
  v12.super_class = (Class)CEMApplicationAppStoreDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[CEMAssetBaseDescriptor copy](self->_payloadDescriptor, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSString copy](self->_payloadBundleIdentifier, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadITunesStoreID, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (CEMAssetBaseDescriptor)payloadDescriptor
{
  return self->_payloadDescriptor;
}

- (void)setPayloadDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadBundleIdentifier
{
  return self->_payloadBundleIdentifier;
}

- (void)setPayloadBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadITunesStoreID
{
  return self->_payloadITunesStoreID;
}

- (void)setPayloadITunesStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadITunesStoreID, 0);
  objc_storeStrong((id *)&self->_payloadBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDescriptor, 0);
}

@end
