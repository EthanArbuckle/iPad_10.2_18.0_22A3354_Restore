@implementation CEMSystemAirPrintPrintersDeclaration_AirPrintItem

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("IPAddress");
  v6[1] = CFSTR("ResourcePath");
  v6[2] = CFSTR("Port");
  v6[3] = CFSTR("ForceTLS");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithIPAddress:(id)a3 withResourcePath:(id)a4 withPort:(id)a5 withForceTLS:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadIPAddress:", v12);

  objc_msgSend(v13, "setPayloadResourcePath:", v11);
  objc_msgSend(v13, "setPayloadPort:", v10);

  if (v9)
    v14 = v9;
  else
    v14 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v13, "setPayloadForceTLS:", v14);

  return v13;
}

+ (id)buildRequiredOnlyWithIPAddress:(id)a3 withResourcePath:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadIPAddress:", v6);

  objc_msgSend(v7, "setPayloadResourcePath:", v5);
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
  NSString *payloadIPAddress;
  NSString *v16;
  NSString *payloadResourcePath;
  NSNumber *v18;
  NSNumber *payloadPort;
  NSNumber *v20;
  NSNumber *payloadForceTLS;
  id v23;
  id v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMSystemAirPrintPrintersDeclaration_AirPrintItem allowedPayloadKeys](CEMSystemAirPrintPrintersDeclaration_AirPrintItem, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IPAddress"), 1, 0, &v26);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadIPAddress = self->_payloadIPAddress;
  self->_payloadIPAddress = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ResourcePath"), 1, 0, &v25);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadResourcePath = self->_payloadResourcePath;
    self->_payloadResourcePath = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Port"), 0, 0, &v24);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadPort = self->_payloadPort;
      self->_payloadPort = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ForceTLS"), 0, MEMORY[0x24BDBD1C0], &v23);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadForceTLS = self->_payloadForceTLS;
        self->_payloadForceTLS = v20;

      }
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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("IPAddress"), self->_payloadIPAddress, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ResourcePath"), self->_payloadResourcePath, 1, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Port"), self->_payloadPort, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ForceTLS"), self->_payloadForceTLS, 0, MEMORY[0x24BDBD1C0]);
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
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMSystemAirPrintPrintersDeclaration_AirPrintItem;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadIPAddress, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadResourcePath, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadPort, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadForceTLS, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadIPAddress
{
  return self->_payloadIPAddress;
}

- (void)setPayloadIPAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadResourcePath
{
  return self->_payloadResourcePath;
}

- (void)setPayloadResourcePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadForceTLS
{
  return self->_payloadForceTLS;
}

- (void)setPayloadForceTLS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadForceTLS, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadResourcePath, 0);
  objc_storeStrong((id *)&self->_payloadIPAddress, 0);
}

@end
