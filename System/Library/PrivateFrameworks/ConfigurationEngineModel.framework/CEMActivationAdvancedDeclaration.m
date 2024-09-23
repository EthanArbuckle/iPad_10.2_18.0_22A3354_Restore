@implementation CEMActivationAdvancedDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.activation.advanced");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("RequiredConfigurations");
  v6[1] = CFSTR("StandardConfigurations");
  v6[2] = CFSTR("ActivationPredicate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withRequiredConfigurations:(id)a4 withStandardConfigurations:(id)a5 withActivationPredicate:(id)a6
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
  objc_msgSend(v13, "setDeclarationType:", CFSTR("com.apple.activation.advanced"));
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
  objc_msgSend(v13, "setPayloadRequiredConfigurations:", v12);

  objc_msgSend(v13, "setPayloadStandardConfigurations:", v11);
  objc_msgSend(v13, "setPayloadActivationPredicate:", v10);

  objc_msgSend(v13, "updateServerHash");
  return v13;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withRequiredConfigurations:(id)a4 withStandardConfigurations:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.activation.advanced"));
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
  objc_msgSend(v10, "setPayloadRequiredConfigurations:", v9);

  objc_msgSend(v10, "setPayloadStandardConfigurations:", v8);
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
  NSArray *v13;
  id v14;
  NSArray *payloadRequiredConfigurations;
  NSArray *v16;
  NSArray *payloadStandardConfigurations;
  CEMAnyPayload *v18;
  CEMAnyPayload *payloadActivationPredicate;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMActivationAdvancedDeclaration allowedPayloadKeys](CEMActivationAdvancedDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("RequiredConfigurations"), objc_opt_class(), 0, 1, 0, &v23);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadRequiredConfigurations = self->_payloadRequiredConfigurations;
  self->_payloadRequiredConfigurations = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("StandardConfigurations"), objc_opt_class(), 0, 1, 0, &v22);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadStandardConfigurations = self->_payloadStandardConfigurations;
    self->_payloadStandardConfigurations = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("ActivationPredicate"), objc_opt_class(), 0, 0, &v21);
      v18 = (CEMAnyPayload *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadActivationPredicate = self->_payloadActivationPredicate;
      self->_payloadActivationPredicate = v18;

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
  NSArray *payloadRequiredConfigurations;
  uint64_t v7;
  id v8;
  NSArray *payloadStandardConfigurations;
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
  payloadRequiredConfigurations = self->_payloadRequiredConfigurations;
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __71__CEMActivationAdvancedDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_24C638658;
  v8 = v4;
  v19 = v8;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("RequiredConfigurations"), payloadRequiredConfigurations, v18, 1, 0);
  payloadStandardConfigurations = self->_payloadStandardConfigurations;
  v13 = v7;
  v14 = 3221225472;
  v15 = __71__CEMActivationAdvancedDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v16 = &unk_24C638658;
  v17 = v8;
  v10 = v8;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("StandardConfigurations"), payloadStandardConfigurations, &v13, 1, 0);
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("ActivationPredicate"), self->_payloadActivationPredicate, &__block_literal_global, 0, 0, v13, v14, v15, v16);
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

uint64_t __71__CEMActivationAdvancedDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__CEMActivationAdvancedDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__CEMActivationAdvancedDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
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
  v12.super_class = (Class)CEMActivationAdvancedDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadRequiredConfigurations, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSArray copy](self->_payloadStandardConfigurations, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[CEMAnyPayload copy](self->_payloadActivationPredicate, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  return v4;
}

- (NSArray)payloadRequiredConfigurations
{
  return self->_payloadRequiredConfigurations;
}

- (void)setPayloadRequiredConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)payloadStandardConfigurations
{
  return self->_payloadStandardConfigurations;
}

- (void)setPayloadStandardConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CEMAnyPayload)payloadActivationPredicate
{
  return self->_payloadActivationPredicate;
}

- (void)setPayloadActivationPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadActivationPredicate, 0);
  objc_storeStrong((id *)&self->_payloadStandardConfigurations, 0);
  objc_storeStrong((id *)&self->_payloadRequiredConfigurations, 0);
}

uint64_t __90__CEMActivationAdvancedDeclaration_ConfigurationsItem_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
}

uint64_t __59__CEMActivationAdvancedDeclaration_Status_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
}

@end
