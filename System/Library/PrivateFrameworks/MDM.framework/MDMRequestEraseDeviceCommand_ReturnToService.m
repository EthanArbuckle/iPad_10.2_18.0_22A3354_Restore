@implementation MDMRequestEraseDeviceCommand_ReturnToService

+ (NSSet)allowedCommandKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Enabled");
  v6[1] = CFSTR("WiFiProfileData");
  v6[2] = CFSTR("MDMProfileData");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 wiFiProfileData:(id)a4 mdmProfileData:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setCommandEnabled:", v9);

  objc_msgSend(v10, "setCommandWiFiProfileData:", v8);
  objc_msgSend(v10, "setCommandMDMProfileData:", v7);

  return v10;
}

+ (id)buildRequiredOnlyWithEnabled:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCommandEnabled:", v3);

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v18;
  _QWORD v19[2];

  v6 = a4;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[MDMRequestEraseDeviceCommand_ReturnToService allowedCommandKeys](MDMRequestEraseDeviceCommand_ReturnToService, "allowedCommandKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  if (objc_msgSend(v11, "count"))
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected payload keys: %@"), v11, *MEMORY[0x24BDD0FC8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_7;
  }
  if (!-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Enabled"), CFSTR("commandEnabled"), 1, 0, a5))
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v16 = 0;
  if (-[RMModelPayloadBase loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:](self, "loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:", v8, CFSTR("WiFiProfileData"), CFSTR("commandWiFiProfileData"), 0, 0, v6, a5))
  {
    v16 = -[RMModelPayloadBase loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:](self, "loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:", v8, CFSTR("MDMProfileData"), CFSTR("commandMDMProfileData"), 0, 0, v6, a5);
  }
LABEL_8:

  return v16;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  -[MDMRequestEraseDeviceCommand_ReturnToService commandEnabled](self, "commandEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Enabled"), v6, 1, 0);

  -[MDMRequestEraseDeviceCommand_ReturnToService commandWiFiProfileData](self, "commandWiFiProfileData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:](self, "serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:", v5, CFSTR("WiFiProfileData"), v7, 0, 0, v3);

  -[MDMRequestEraseDeviceCommand_ReturnToService commandMDMProfileData](self, "commandMDMProfileData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:](self, "serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:", v5, CFSTR("MDMProfileData"), v8, 0, 0, v3);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
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
  v12.super_class = (Class)MDMRequestEraseDeviceCommand_ReturnToService;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_commandEnabled, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSData copy](self->_commandWiFiProfileData, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSData copy](self->_commandMDMProfileData, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSNumber)commandEnabled
{
  return self->_commandEnabled;
}

- (void)setCommandEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)commandWiFiProfileData
{
  return self->_commandWiFiProfileData;
}

- (void)setCommandWiFiProfileData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)commandMDMProfileData
{
  return self->_commandMDMProfileData;
}

- (void)setCommandMDMProfileData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandMDMProfileData, 0);
  objc_storeStrong((id *)&self->_commandWiFiProfileData, 0);
  objc_storeStrong((id *)&self->_commandEnabled, 0);
}

@end
