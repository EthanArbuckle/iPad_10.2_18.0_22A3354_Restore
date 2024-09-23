@implementation MDMRequestDeviceLockCommand

+ (id)requestType
{
  return CFSTR("DeviceLock");
}

+ (unint64_t)requiredAccessRights
{
  return 4;
}

+ (id)requestWithMessage:(id)a3 phoneNumber:(id)a4 PIN:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setCommandMessage:", v9);

  objc_msgSend(v10, "setCommandPhoneNumber:", v8);
  objc_msgSend(v10, "setCommandPIN:", v7);

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7;
  BOOL v8;

  v7 = a3;
  v8 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Message"), CFSTR("commandMessage"), 0, 0, a5))
  {
    v8 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PhoneNumber"), CFSTR("commandPhoneNumber"), 0, 0, a5))
    {
      v8 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PIN"), CFSTR("commandPIN"), 0, 0, a5);
    }
  }

  return v8;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[MDMRequestDeviceLockCommand commandMessage](self, "commandMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Message"), v5, 0, 0);

  -[MDMRequestDeviceLockCommand commandPhoneNumber](self, "commandPhoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PhoneNumber"), v6, 0, 0);

  -[MDMRequestDeviceLockCommand commandPIN](self, "commandPIN");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PIN"), v7, 0, 0);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
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
  v12.super_class = (Class)MDMRequestDeviceLockCommand;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_commandMessage, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_commandPhoneNumber, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_commandPIN, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)commandMessage
{
  return self->_commandMessage;
}

- (void)setCommandMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)commandPhoneNumber
{
  return self->_commandPhoneNumber;
}

- (void)setCommandPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)commandPIN
{
  return self->_commandPIN;
}

- (void)setCommandPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandPIN, 0);
  objc_storeStrong((id *)&self->_commandPhoneNumber, 0);
  objc_storeStrong((id *)&self->_commandMessage, 0);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *))a4;
  -[MDMRequestDeviceLockCommand commandMessage](self, "commandMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMRequestDeviceLockCommand commandPhoneNumber](self, "commandPhoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMFindMyUtilities lockDeviceWithMessage:phoneNumber:](MDMFindMyUtilities, "lockDeviceWithMessage:phoneNumber:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("MessageResult");
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v10);

  v5[2](v5, v9);
}

@end
