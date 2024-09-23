@implementation AppleCommonSchemaDeviceInfo

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (void)setSystemBuild:(id)a3
{
  NSString *v4;
  NSString *systemBuild;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  systemBuild = self->_systemBuild;
  self->_systemBuild = v4;

}

- (void)setDeviceType:(id)a3
{
  NSString *v4;
  NSString *deviceType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  deviceType = self->_deviceType;
  self->_deviceType = v4;

}

- (void)setDeviceId:(id)a3
{
  NSString *v4;
  NSString *deviceId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  deviceId = self->_deviceId;
  self->_deviceId = v4;

}

- (BOOL)readFrom:(id)a3
{
  return sub_20E88C420(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[AppleCommonSchemaDeviceInfo isInternal](self, "isInternal"))
    PBDataWriterWriteBOOLField();
  -[AppleCommonSchemaDeviceInfo systemBuild](self, "systemBuild");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[AppleCommonSchemaDeviceInfo deviceType](self, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[AppleCommonSchemaDeviceInfo deviceId](self, "deviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int isInternal;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  isInternal = self->_isInternal;
  if (isInternal != objc_msgSend(v4, "isInternal"))
    goto LABEL_18;
  -[AppleCommonSchemaDeviceInfo systemBuild](self, "systemBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemBuild");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[AppleCommonSchemaDeviceInfo systemBuild](self, "systemBuild");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[AppleCommonSchemaDeviceInfo systemBuild](self, "systemBuild");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemBuild");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_18;
  }
  else
  {

  }
  -[AppleCommonSchemaDeviceInfo deviceType](self, "deviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_17;
  -[AppleCommonSchemaDeviceInfo deviceType](self, "deviceType");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[AppleCommonSchemaDeviceInfo deviceType](self, "deviceType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  else
  {

  }
  -[AppleCommonSchemaDeviceInfo deviceId](self, "deviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[AppleCommonSchemaDeviceInfo deviceId](self, "deviceId");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

LABEL_21:
      v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    -[AppleCommonSchemaDeviceInfo deviceId](self, "deviceId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
LABEL_17:

  }
LABEL_18:
  v23 = 0;
LABEL_19:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  if (self->_isInternal)
    v3 = 2654435761;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_systemBuild, "hash");
  v5 = v4 ^ -[NSString hash](self->_deviceType, "hash") ^ v3;
  return v5 ^ -[NSString hash](self->_deviceId, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_deviceId)
  {
    -[AppleCommonSchemaDeviceInfo deviceId](self, "deviceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceId"));

  }
  if (self->_deviceType)
  {
    -[AppleCommonSchemaDeviceInfo deviceType](self, "deviceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("deviceType"));

  }
  if (self->_isInternal)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AppleCommonSchemaDeviceInfo isInternal](self, "isInternal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isInternal"));

  }
  if (self->_systemBuild)
  {
    -[AppleCommonSchemaDeviceInfo systemBuild](self, "systemBuild");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("systemBuild"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCommonSchemaDeviceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSData *)v3;
  }
  else
  {

    return (NSData *)0;
  }
}

- (AppleCommonSchemaDeviceInfo)initWithJSON:(id)a3
{
  void *v4;
  AppleCommonSchemaDeviceInfo *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[AppleCommonSchemaDeviceInfo initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCommonSchemaDeviceInfo)initWithDictionary:(id)a3
{
  id v4;
  AppleCommonSchemaDeviceInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AppleCommonSchemaDeviceInfo *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AppleCommonSchemaDeviceInfo;
  v5 = -[AppleCommonSchemaDeviceInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isInternal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCommonSchemaDeviceInfo setIsInternal:](v5, "setIsInternal:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemBuild"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[AppleCommonSchemaDeviceInfo setSystemBuild:](v5, "setSystemBuild:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[AppleCommonSchemaDeviceInfo setDeviceType:](v5, "setDeviceType:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[AppleCommonSchemaDeviceInfo setDeviceId:](v5, "setDeviceId:", v12);

    }
    v13 = v5;

  }
  return v5;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

@end
