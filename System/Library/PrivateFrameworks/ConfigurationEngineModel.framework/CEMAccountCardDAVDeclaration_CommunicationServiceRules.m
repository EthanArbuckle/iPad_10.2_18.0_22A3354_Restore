@implementation CEMAccountCardDAVDeclaration_CommunicationServiceRules

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("DefaultServiceHandlers");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDefaultServiceHandlers:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadDefaultServiceHandlers:", v3);

  return v4;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  CEMAccountCardDAVDeclaration_CommunicationServiceRulesDefaultServiceHandlers *v13;
  id v14;
  CEMAccountCardDAVDeclaration_CommunicationServiceRulesDefaultServiceHandlers *payloadDefaultServiceHandlers;
  id v17;

  v6 = (void *)MEMORY[0x24BDBCEF0];
  v7 = a3;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMAccountCardDAVDeclaration_CommunicationServiceRules allowedPayloadKeys](CEMAccountCardDAVDeclaration_CommunicationServiceRules, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v17 = 0;
  -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v7, CFSTR("DefaultServiceHandlers"), objc_opt_class(), 0, 0, &v17);
  v13 = (CEMAccountCardDAVDeclaration_CommunicationServiceRulesDefaultServiceHandlers *)objc_claimAutoreleasedReturnValue();

  v14 = v17;
  payloadDefaultServiceHandlers = self->_payloadDefaultServiceHandlers;
  self->_payloadDefaultServiceHandlers = v13;

  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  CEMAccountCardDAVDeclaration_CommunicationServiceRulesDefaultServiceHandlers *payloadDefaultServiceHandlers;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  payloadDefaultServiceHandlers = self->_payloadDefaultServiceHandlers;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __93__CEMAccountCardDAVDeclaration_CommunicationServiceRules_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_24C638560;
  v11 = v4;
  v7 = v4;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("DefaultServiceHandlers"), payloadDefaultServiceHandlers, v10, 0, 0);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CEMAccountCardDAVDeclaration_CommunicationServiceRules;
  v4 = -[CEMPayloadBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[CEMAccountCardDAVDeclaration_CommunicationServiceRulesDefaultServiceHandlers copy](self->_payloadDefaultServiceHandlers, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (CEMAccountCardDAVDeclaration_CommunicationServiceRulesDefaultServiceHandlers)payloadDefaultServiceHandlers
{
  return self->_payloadDefaultServiceHandlers;
}

- (void)setPayloadDefaultServiceHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDefaultServiceHandlers, 0);
}

@end
