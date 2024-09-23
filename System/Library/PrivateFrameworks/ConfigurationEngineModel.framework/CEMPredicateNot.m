@implementation CEMPredicateNot

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Predicates");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.predicate.not");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Type");
  v6[1] = CFSTR("Predicate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithPredicate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadType:", CFSTR("com.apple.predicate.not"));
  objc_msgSend(v4, "setPayloadPredicate:", v3);

  return v4;
}

+ (id)buildRequiredOnlyWithPredicate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadType:", CFSTR("com.apple.predicate.not"));
  objc_msgSend(v4, "setPayloadPredicate:", v3);

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
  NSString *v13;
  id v14;
  NSString *payloadType;
  void *v16;
  CEMPredicateBase *v17;
  CEMPredicateBase *payloadPredicate;
  id v20;
  id v21;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMPredicateNot allowedPayloadKeys](CEMPredicateNot, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v21 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Type"), 1, 0, &v21);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v21;
  payloadType = self->super._payloadType;
  self->super._payloadType = v13;

  if (!v14)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Predicate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    +[CEMPredicateBase predicateForPayload:error:](CEMPredicateBase, "predicateForPayload:error:", v16, &v20);
    v17 = (CEMPredicateBase *)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    payloadPredicate = self->_payloadPredicate;
    self->_payloadPredicate = v17;

  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Type"), self->super._payloadType, 1, 0);
  -[CEMPayloadBase serializePayload](self->_payloadPredicate, "serializePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Predicate"));

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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CEMPredicateNot;
  v4 = -[CEMPredicateBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->super._payloadType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[CEMPredicateBase copy](self->_payloadPredicate, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (CEMPredicateBase)payloadPredicate
{
  return self->_payloadPredicate;
}

- (void)setPayloadPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPredicate, 0);
}

@end
