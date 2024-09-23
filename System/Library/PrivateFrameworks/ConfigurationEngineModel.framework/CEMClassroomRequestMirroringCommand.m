@implementation CEMClassroomRequestMirroringCommand

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Commands");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.command.classroom.mirroring.request");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("DestinationName");
  v6[1] = CFSTR("DestinationDeviceID");
  v6[2] = CFSTR("ScanTime");
  v6[3] = CFSTR("Password");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)executionLevel
{
  return 0;
}

+ (id)buildWithIdentifier:(id)a3 withDestinationName:(id)a4 withDestinationDeviceID:(id)a5 withScanTime:(id)a6 withPassword:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setCommandType:", CFSTR("com.apple.command.classroom.mirroring.request"));
  if (v11)
  {
    objc_msgSend(v16, "setCommandIdentifier:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCommandIdentifier:", v18);

  }
  objc_msgSend(v16, "setPayloadDestinationName:", v15);

  objc_msgSend(v16, "setPayloadDestinationDeviceID:", v14);
  objc_msgSend(v16, "setPayloadScanTime:", v13);

  objc_msgSend(v16, "setPayloadPassword:", v12);
  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCommandType:", CFSTR("com.apple.command.classroom.mirroring.request"));
  if (v3)
  {
    objc_msgSend(v4, "setCommandIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCommandIdentifier:", v6);

  }
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
  NSString *payloadDestinationName;
  NSString *v16;
  NSString *payloadDestinationDeviceID;
  NSNumber *v18;
  NSNumber *payloadScanTime;
  NSString *v20;
  NSString *payloadPassword;
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

  +[CEMClassroomRequestMirroringCommand allowedPayloadKeys](CEMClassroomRequestMirroringCommand, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DestinationName"), 0, 0, &v26);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadDestinationName = self->_payloadDestinationName;
  self->_payloadDestinationName = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DestinationDeviceID"), 0, 0, &v25);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadDestinationDeviceID = self->_payloadDestinationDeviceID;
    self->_payloadDestinationDeviceID = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ScanTime"), 0, 0, &v24);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadScanTime = self->_payloadScanTime;
      self->_payloadScanTime = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Password"), 0, 0, &v23);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadPassword = self->_payloadPassword;
        self->_payloadPassword = v20;

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
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DestinationName"), self->_payloadDestinationName, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DestinationDeviceID"), self->_payloadDestinationDeviceID, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ScanTime"), self->_payloadScanTime, 0, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Password"), self->_payloadPassword, 0, 0);
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
  v14.super_class = (Class)CEMClassroomRequestMirroringCommand;
  v4 = -[CEMCommandBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadDestinationName, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[NSString copy](self->_payloadDestinationDeviceID, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  v9 = -[NSNumber copy](self->_payloadScanTime, "copy");
  v10 = (void *)v4[9];
  v4[9] = v9;

  v11 = -[NSString copy](self->_payloadPassword, "copy");
  v12 = (void *)v4[10];
  v4[10] = v11;

  return v4;
}

- (NSString)payloadDestinationName
{
  return self->_payloadDestinationName;
}

- (void)setPayloadDestinationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadDestinationDeviceID
{
  return self->_payloadDestinationDeviceID;
}

- (void)setPayloadDestinationDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadScanTime
{
  return self->_payloadScanTime;
}

- (void)setPayloadScanTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadScanTime, 0);
  objc_storeStrong((id *)&self->_payloadDestinationDeviceID, 0);
  objc_storeStrong((id *)&self->_payloadDestinationName, 0);
}

@end
