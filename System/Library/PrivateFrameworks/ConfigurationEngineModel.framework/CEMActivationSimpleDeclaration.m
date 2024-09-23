@implementation CEMActivationSimpleDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.activation.simple");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("StandardConfigurations");
  v6[1] = CFSTR("Predicate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withStandardConfigurations:(id)a4 withPredicate:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.activation.simple"));
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
  objc_msgSend(v10, "setPayloadStandardConfigurations:", v9);

  objc_msgSend(v10, "setPayloadPredicate:", v8);
  objc_msgSend(v10, "updateServerHash");

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withStandardConfigurations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.activation.simple"));
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
  objc_msgSend(v7, "setPayloadStandardConfigurations:", v6);

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
  NSArray *v13;
  id v14;
  NSArray *payloadStandardConfigurations;
  void *v16;
  CEMPredicateBase *v17;
  CEMPredicateBase *payloadPredicate;
  BOOL v19;
  id v21;
  id v22;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMActivationSimpleDeclaration allowedPayloadKeys](CEMActivationSimpleDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v22 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("StandardConfigurations"), &__block_literal_global_1, 1, 0, &v22);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v22;
  payloadStandardConfigurations = self->_payloadStandardConfigurations;
  self->_payloadStandardConfigurations = v13;

  if (!v14)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Predicate"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v19 = 1;
      goto LABEL_8;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Predicate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    +[CEMPredicateBase predicateForPayload:error:](CEMPredicateBase, "predicateForPayload:error:", v16, &v21);
    v17 = (CEMPredicateBase *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    payloadPredicate = self->_payloadPredicate;
    self->_payloadPredicate = v17;

  }
  v19 = v14 == 0;
  if (a4 && v14)
  {
    v14 = objc_retainAutorelease(v14);
    v19 = 0;
    *a4 = v14;
  }
LABEL_8:

  return v19;
}

uint64_t __52__CEMActivationSimpleDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  CEMPredicateBase *payloadPredicate;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("StandardConfigurations"), self->_payloadStandardConfigurations, &__block_literal_global_16, 1, 0);
  payloadPredicate = self->_payloadPredicate;
  if (payloadPredicate)
  {
    -[CEMPayloadBase serializePayload](payloadPredicate, "serializePayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Predicate"));

  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

id __69__CEMActivationSimpleDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
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
  v10.super_class = (Class)CEMActivationSimpleDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadStandardConfigurations, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[CEMPredicateBase copy](self->_payloadPredicate, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSArray)payloadStandardConfigurations
{
  return self->_payloadStandardConfigurations;
}

- (void)setPayloadStandardConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CEMPredicateBase)payloadPredicate
{
  return self->_payloadPredicate;
}

- (void)setPayloadPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPredicate, 0);
  objc_storeStrong((id *)&self->_payloadStandardConfigurations, 0);
}

uint64_t __57__CEMActivationSimpleDeclaration_Status_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayload");
}

@end
