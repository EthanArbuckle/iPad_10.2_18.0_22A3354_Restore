@implementation CEMNetworkContentCachingDeclaration_Ranges

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("type");
  v6[1] = CFSTR("first");
  v6[2] = CFSTR("last");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithType:(id)a3 withFirst:(id)a4 withLast:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  v7 = a5;
  v8 = a4;
  v9 = (__CFString *)a3;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = CFSTR("IPv4");
  objc_msgSend(v10, "setPayloadType:", v12);

  objc_msgSend(v11, "setPayloadFirst:", v8);
  objc_msgSend(v11, "setPayloadLast:", v7);

  return v11;
}

+ (id)buildRequiredOnlyWithFirst:(id)a3 withLast:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadFirst:", v6);

  objc_msgSend(v7, "setPayloadLast:", v5);
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
  NSString *payloadType;
  NSString *v16;
  NSString *payloadFirst;
  NSString *v18;
  NSString *payloadLast;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMNetworkContentCachingDeclaration_Ranges allowedPayloadKeys](CEMNetworkContentCachingDeclaration_Ranges, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v23 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("type"), 0, CFSTR("IPv4"), &v23);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  payloadType = self->_payloadType;
  self->_payloadType = v13;

  if (!v14)
  {
    v22 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("first"), 1, 0, &v22);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v22;
    payloadFirst = self->_payloadFirst;
    self->_payloadFirst = v16;

    if (!v14)
    {
      v21 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("last"), 1, 0, &v21);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      payloadLast = self->_payloadLast;
      self->_payloadLast = v18;

    }
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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("type"), self->_payloadType, 0, CFSTR("IPv4"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("first"), self->_payloadFirst, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("last"), self->_payloadLast, 1, 0);
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
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEMNetworkContentCachingDeclaration_Ranges;
  v4 = -[CEMPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadFirst, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadLast, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadFirst
{
  return self->_payloadFirst;
}

- (void)setPayloadFirst:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadLast
{
  return self->_payloadLast;
}

- (void)setPayloadLast:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLast, 0);
  objc_storeStrong((id *)&self->_payloadFirst, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end
