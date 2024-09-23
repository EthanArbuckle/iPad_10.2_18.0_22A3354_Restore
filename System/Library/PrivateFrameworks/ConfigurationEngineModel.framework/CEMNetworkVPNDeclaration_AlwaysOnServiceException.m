@implementation CEMNetworkVPNDeclaration_AlwaysOnServiceException

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("ServiceName");
  v6[1] = CFSTR("Action");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithServiceName:(id)a3 withAction:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadServiceName:", v6);

  objc_msgSend(v7, "setPayloadAction:", v5);
  return v7;
}

+ (id)buildRequiredOnlyWithServiceName:(id)a3 withAction:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadServiceName:", v6);

  objc_msgSend(v7, "setPayloadAction:", v5);
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
  NSString *payloadServiceName;
  NSString *v16;
  NSString *payloadAction;
  id v19;
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkVPNDeclaration_AlwaysOnServiceException allowedPayloadKeys](CEMNetworkVPNDeclaration_AlwaysOnServiceException, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v20 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ServiceName"), 1, 0, &v20);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  payloadServiceName = self->_payloadServiceName;
  self->_payloadServiceName = v13;

  if (!v14)
  {
    v19 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Action"), 1, 0, &v19);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    payloadAction = self->_payloadAction;
    self->_payloadAction = v16;

  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ServiceName"), self->_payloadServiceName, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Action"), self->_payloadAction, 1, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
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
  v10.super_class = (Class)CEMNetworkVPNDeclaration_AlwaysOnServiceException;
  v4 = -[CEMPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadServiceName, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadAction, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadServiceName
{
  return self->_payloadServiceName;
}

- (void)setPayloadServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadAction
{
  return self->_payloadAction;
}

- (void)setPayloadAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAction, 0);
  objc_storeStrong((id *)&self->_payloadServiceName, 0);
}

@end
