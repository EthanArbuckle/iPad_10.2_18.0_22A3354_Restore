@implementation CEMEventSubscriptionDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.event.subscription");
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
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Events");
  v6[1] = CFSTR("Schedule");
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
  return 1;
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

+ (id)buildWithIdentifier:(id)a3 withEvents:(id)a4 withSchedule:(id)a5
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
  objc_msgSend(v10, "setDeclarationType:", CFSTR("com.apple.configuration.event.subscription"));
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
  objc_msgSend(v10, "setPayloadEvents:", v9);

  objc_msgSend(v10, "setPayloadSchedule:", v8);
  objc_msgSend(v10, "updateServerHash");

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEvents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.event.subscription"));
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
  objc_msgSend(v7, "setPayloadEvents:", v6);

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSArray *v25;
  NSArray *payloadEvents;
  CEMEventSubscriptionDeclaration_Schedule *v27;
  CEMEventSubscriptionDeclaration_Schedule *payloadSchedule;
  BOOL v29;
  id *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMEventSubscriptionDeclaration allowedPayloadKeys](CEMEventSubscriptionDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v13 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Events"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Events"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v17)
  {
    v18 = v17;
    v31 = a4;
    v32 = v9;
    v19 = 0;
    v20 = *(_QWORD *)v36;
LABEL_3:
    v21 = 0;
    v22 = v19;
    while (1)
    {
      if (*(_QWORD *)v36 != v20)
        objc_enumerationMutation(v16);
      v23 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v21);
      v34 = v22;
      +[CEMEventBase eventForPayload:error:](CEMEventBase, "eventForPayload:error:", v23, &v34);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v34;

      if (!v24)
        break;
      objc_msgSend(v15, "addObject:", v24);

      ++v21;
      v22 = v19;
      if (v18 == v21)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v18)
          goto LABEL_3;
        break;
      }
    }

    v9 = v32;
    a4 = v31;
    if (v19)
      goto LABEL_13;
  }
  else
  {

  }
  v25 = (NSArray *)objc_msgSend(v15, "copy");
  payloadEvents = self->_payloadEvents;
  self->_payloadEvents = v25;

  v33 = 0;
  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("Schedule"), objc_opt_class(), 0, 0, &v33);
  v27 = (CEMEventSubscriptionDeclaration_Schedule *)objc_claimAutoreleasedReturnValue();
  v19 = v33;
  payloadSchedule = self->_payloadSchedule;
  self->_payloadSchedule = v27;

  if (!v19)
  {

    v29 = 1;
    goto LABEL_17;
  }
LABEL_13:

  if (a4)
  {
    v19 = objc_retainAutorelease(v19);
    v29 = 0;
    *a4 = v19;
  }
  else
  {
    v29 = 0;
  }
LABEL_17:

  return v29;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CEMEventSubscriptionDeclaration_Schedule *payloadSchedule;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_payloadEvents, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = self->_payloadEvents;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "serializePayload");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Events"));

  payloadSchedule = self->_payloadSchedule;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __70__CEMEventSubscriptionDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_24C638560;
  v19 = v4;
  v15 = v4;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Schedule"), payloadSchedule, v18, 0, 0);
  v16 = (void *)objc_msgSend(v5, "copy");

  return v16;
}

uint64_t __70__CEMEventSubscriptionDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
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
  v10.super_class = (Class)CEMEventSubscriptionDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadEvents, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[CEMEventSubscriptionDeclaration_Schedule copy](self->_payloadSchedule, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSArray)payloadEvents
{
  return self->_payloadEvents;
}

- (void)setPayloadEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CEMEventSubscriptionDeclaration_Schedule)payloadSchedule
{
  return self->_payloadSchedule;
}

- (void)setPayloadSchedule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSchedule, 0);
  objc_storeStrong((id *)&self->_payloadEvents, 0);
}

@end
