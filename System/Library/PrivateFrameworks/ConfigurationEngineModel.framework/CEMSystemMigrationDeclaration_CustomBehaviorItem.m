@implementation CEMSystemMigrationDeclaration_CustomBehaviorItem

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Context");
  v6[1] = CFSTR("Paths");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithContext:(id)a3 withPaths:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadContext:", v6);

  objc_msgSend(v7, "setPayloadPaths:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithContext:(id)a3 withPaths:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadContext:", v6);

  objc_msgSend(v7, "setPayloadPaths:", v5);
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
  NSString *v13;
  id v14;
  NSString *payloadContext;
  NSArray *v16;
  NSArray *payloadPaths;
  id v19;
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemMigrationDeclaration_CustomBehaviorItem allowedPayloadKeys](CEMSystemMigrationDeclaration_CustomBehaviorItem, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v20 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Context"), 1, 0, &v20);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  payloadContext = self->_payloadContext;
  self->_payloadContext = v13;

  if (!v14)
  {
    v19 = 0;
    -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("Paths"), objc_opt_class(), 0, 1, 0, &v19);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    payloadPaths = self->_payloadPaths;
    self->_payloadPaths = v16;

  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  NSArray *payloadPaths;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Context"), self->_payloadContext, 1, 0);
  payloadPaths = self->_payloadPaths;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__CEMSystemMigrationDeclaration_CustomBehaviorItem_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_24C63A2F0;
  v11 = v4;
  v7 = v4;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Paths"), payloadPaths, v10, 1, 0);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
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
  v10.super_class = (Class)CEMSystemMigrationDeclaration_CustomBehaviorItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadContext, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_payloadPaths, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadContext
{
  return self->_payloadContext;
}

- (void)setPayloadContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)payloadPaths
{
  return self->_payloadPaths;
}

- (void)setPayloadPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPaths, 0);
  objc_storeStrong((id *)&self->_payloadContext, 0);
}

@end
