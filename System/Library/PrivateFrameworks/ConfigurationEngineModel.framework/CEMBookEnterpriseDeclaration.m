@implementation CEMBookEnterpriseDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.asset.book.enterprise");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Descriptor");
  v6[1] = CFSTR("Reference");
  v6[2] = CFSTR("Kind");
  v6[3] = CFSTR("Version");
  v6[4] = CFSTR("Author");
  v6[5] = CFSTR("Title");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withDescriptor:(id)a4 withReference:(id)a5 withKind:(id)a6 withVersion:(id)a7 withAuthor:(id)a8 withTitle:(id)a9
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

  v14 = a3;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setDeclarationType:", CFSTR("com.apple.asset.book.enterprise"));
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
  objc_msgSend(v21, "setPayloadDescriptor:", v20);

  objc_msgSend(v21, "setPayloadReference:", v19);
  objc_msgSend(v21, "setPayloadKind:", v18);

  objc_msgSend(v21, "setPayloadVersion:", v17);
  objc_msgSend(v21, "setPayloadAuthor:", v16);

  objc_msgSend(v21, "setPayloadTitle:", v15);
  objc_msgSend(v21, "updateServerHash");

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withDescriptor:(id)a4 withReference:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.asset.book.enterprise"));
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
  objc_msgSend(v10, "setPayloadDescriptor:", v9);

  objc_msgSend(v10, "setPayloadReference:", v8);
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
  CEMAssetBaseDescriptor *v13;
  id v14;
  CEMAssetBaseDescriptor *payloadDescriptor;
  CEMAssetBaseReference *v16;
  CEMAssetBaseReference *payloadReference;
  NSString *v18;
  NSString *payloadKind;
  NSString *v20;
  NSString *payloadVersion;
  NSString *v22;
  NSString *payloadAuthor;
  NSString *v24;
  NSString *payloadTitle;
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

  +[CEMBookEnterpriseDeclaration allowedPayloadKeys](CEMBookEnterpriseDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v32 = 0;
  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("Descriptor"), objc_opt_class(), 1, 0, &v32);
  v13 = (CEMAssetBaseDescriptor *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  payloadDescriptor = self->_payloadDescriptor;
  self->_payloadDescriptor = v13;

  if (!v14)
  {
    v31 = 0;
    -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("Reference"), objc_opt_class(), 1, 0, &v31);
    v16 = (CEMAssetBaseReference *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    payloadReference = self->_payloadReference;
    self->_payloadReference = v16;

    if (!v14)
    {
      v30 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Kind"), 0, 0, &v30);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      payloadKind = self->_payloadKind;
      self->_payloadKind = v18;

      if (!v14)
      {
        v29 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Version"), 0, 0, &v29);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v29;
        payloadVersion = self->_payloadVersion;
        self->_payloadVersion = v20;

        if (!v14)
        {
          v28 = 0;
          -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Author"), 0, 0, &v28);
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = v28;
          payloadAuthor = self->_payloadAuthor;
          self->_payloadAuthor = v22;

          if (!v14)
          {
            v27 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Title"), 0, 0, &v27);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v27;
            payloadTitle = self->_payloadTitle;
            self->_payloadTitle = v24;

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
  CEMAssetBaseDescriptor *payloadDescriptor;
  uint64_t v7;
  id v8;
  CEMAssetBaseReference *payloadReference;
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
  payloadDescriptor = self->_payloadDescriptor;
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67__CEMBookEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_24C638560;
  v8 = v4;
  v19 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Descriptor"), payloadDescriptor, v18, 1, 0);
  payloadReference = self->_payloadReference;
  v13 = v7;
  v14 = 3221225472;
  v15 = __67__CEMBookEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v16 = &unk_24C638560;
  v17 = v8;
  v10 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Reference"), payloadReference, &v13, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Kind"), self->_payloadKind, 0, 0, v13, v14, v15, v16);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Version"), self->_payloadVersion, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Author"), self->_payloadAuthor, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Title"), self->_payloadTitle, 0, 0);
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

uint64_t __67__CEMBookEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __67__CEMBookEnterpriseDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CEMBookEnterpriseDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[CEMAssetBaseDescriptor copy](self->_payloadDescriptor, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[CEMAssetBaseReference copy](self->_payloadReference, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSString copy](self->_payloadKind, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSString copy](self->_payloadVersion, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSString copy](self->_payloadAuthor, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadTitle, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

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

- (CEMAssetBaseReference)payloadReference
{
  return self->_payloadReference;
}

- (void)setPayloadReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadKind
{
  return self->_payloadKind;
}

- (void)setPayloadKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadVersion
{
  return self->_payloadVersion;
}

- (void)setPayloadVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)payloadAuthor
{
  return self->_payloadAuthor;
}

- (void)setPayloadAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadTitle
{
  return self->_payloadTitle;
}

- (void)setPayloadTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTitle, 0);
  objc_storeStrong((id *)&self->_payloadAuthor, 0);
  objc_storeStrong((id *)&self->_payloadVersion, 0);
  objc_storeStrong((id *)&self->_payloadKind, 0);
  objc_storeStrong((id *)&self->_payloadReference, 0);
  objc_storeStrong((id *)&self->_payloadDescriptor, 0);
}

@end
