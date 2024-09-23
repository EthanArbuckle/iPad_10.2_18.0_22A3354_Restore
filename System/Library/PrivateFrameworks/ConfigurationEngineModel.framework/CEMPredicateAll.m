@implementation CEMPredicateAll

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Predicates");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.predicate.all");
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
  v6[1] = CFSTR("Predicates");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithPredicates:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadType:", CFSTR("com.apple.predicate.all"));
  objc_msgSend(v4, "setPayloadPredicates:", v3);

  return v4;
}

+ (id)buildRequiredOnlyWithPredicates:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadType:", CFSTR("com.apple.predicate.all"));
  objc_msgSend(v4, "setPayloadPredicates:", v3);

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
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSArray *v28;
  NSArray *payloadPredicates;
  id *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMPredicateAll allowedPayloadKeys](CEMPredicateAll, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v38 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Type"), 1, 0, &v38);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v38;
  payloadType = self->super._payloadType;
  self->super._payloadType = v13;

  if (!v14)
  {
    v17 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Predicates"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Predicates"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v21)
    {
      v22 = v21;
      v31 = a4;
      v32 = v9;
      v14 = 0;
      v23 = *(_QWORD *)v35;
LABEL_6:
      v24 = 0;
      v25 = v14;
      while (1)
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v24);
        v33 = v25;
        +[CEMPredicateBase predicateForPayload:error:](CEMPredicateBase, "predicateForPayload:error:", v26, &v33, v31);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v33;

        if (!v27)
          break;
        objc_msgSend(v19, "addObject:", v27);

        ++v24;
        v25 = v14;
        if (v22 == v24)
        {
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v22)
            goto LABEL_6;
          break;
        }
      }

      v9 = v32;
      if (v14)
      {

        a4 = v31;
        if (v31)
          goto LABEL_3;
LABEL_14:
        v16 = 0;
        goto LABEL_17;
      }
    }
    else
    {

    }
    v28 = (NSArray *)objc_msgSend(v19, "copy");
    payloadPredicates = self->_payloadPredicates;
    self->_payloadPredicates = v28;

    v14 = 0;
    v16 = 1;
    goto LABEL_17;
  }
  if (!a4)
    goto LABEL_14;
LABEL_3:
  v14 = objc_retainAutorelease(v14);
  v16 = 0;
  *a4 = v14;
LABEL_17:

  return v16;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Type"), self->super._payloadType, 1, 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_payloadPredicates, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_payloadPredicates;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "serializePayload", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("Predicates"));

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
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
  v10.super_class = (Class)CEMPredicateAll;
  v4 = -[CEMPredicateBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->super._payloadType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_payloadPredicates, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSArray)payloadPredicates
{
  return self->_payloadPredicates;
}

- (void)setPayloadPredicates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPredicates, 0);
}

@end
