@implementation MXDeviceInfo

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasDeviceVersion
{
  return self->_deviceVersion != 0;
}

- (BOOL)hasSystemName
{
  return self->_systemName != 0;
}

- (BOOL)hasSystemVersion
{
  return self->_systemVersion != 0;
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXDeviceInfo;
  -[MXDeviceInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXDeviceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *deviceName;
  NSString *deviceVersion;
  NSString *systemName;
  NSString *systemVersion;
  NSString *systemBuild;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("device_name"));
  deviceVersion = self->_deviceVersion;
  if (deviceVersion)
    objc_msgSend(v4, "setObject:forKey:", deviceVersion, CFSTR("device_version"));
  systemName = self->_systemName;
  if (systemName)
    objc_msgSend(v4, "setObject:forKey:", systemName, CFSTR("system_name"));
  systemVersion = self->_systemVersion;
  if (systemVersion)
    objc_msgSend(v4, "setObject:forKey:", systemVersion, CFSTR("system_version"));
  systemBuild = self->_systemBuild;
  if (systemBuild)
    objc_msgSend(v4, "setObject:forKey:", systemBuild, CFSTR("system_build"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXDeviceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_systemName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_systemVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_systemBuild)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_deviceName)
  {
    objc_msgSend(v4, "setDeviceName:");
    v4 = v5;
  }
  if (self->_deviceVersion)
  {
    objc_msgSend(v5, "setDeviceVersion:");
    v4 = v5;
  }
  if (self->_systemName)
  {
    objc_msgSend(v5, "setSystemName:");
    v4 = v5;
  }
  if (self->_systemVersion)
  {
    objc_msgSend(v5, "setSystemVersion:");
    v4 = v5;
  }
  if (self->_systemBuild)
  {
    objc_msgSend(v5, "setSystemBuild:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_deviceVersion, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_systemName, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_systemVersion, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[NSString copyWithZone:](self->_systemBuild, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *deviceName;
  NSString *deviceVersion;
  NSString *systemName;
  NSString *systemVersion;
  NSString *systemBuild;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((deviceName = self->_deviceName, !((unint64_t)deviceName | v4[1]))
     || -[NSString isEqual:](deviceName, "isEqual:"))
    && ((deviceVersion = self->_deviceVersion, !((unint64_t)deviceVersion | v4[2]))
     || -[NSString isEqual:](deviceVersion, "isEqual:"))
    && ((systemName = self->_systemName, !((unint64_t)systemName | v4[4]))
     || -[NSString isEqual:](systemName, "isEqual:"))
    && ((systemVersion = self->_systemVersion, !((unint64_t)systemVersion | v4[5]))
     || -[NSString isEqual:](systemVersion, "isEqual:")))
  {
    systemBuild = self->_systemBuild;
    if ((unint64_t)systemBuild | v4[3])
      v10 = -[NSString isEqual:](systemBuild, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_deviceName, "hash");
  v4 = -[NSString hash](self->_deviceVersion, "hash") ^ v3;
  v5 = -[NSString hash](self->_systemName, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_systemVersion, "hash");
  return v6 ^ -[NSString hash](self->_systemBuild, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[MXDeviceInfo setDeviceName:](self, "setDeviceName:");
  if (v4[2])
    -[MXDeviceInfo setDeviceVersion:](self, "setDeviceVersion:");
  if (v4[4])
    -[MXDeviceInfo setSystemName:](self, "setSystemName:");
  if (v4[5])
    -[MXDeviceInfo setSystemVersion:](self, "setSystemVersion:");
  if (v4[3])
    -[MXDeviceInfo setSystemBuild:](self, "setSystemBuild:");

}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)deviceVersion
{
  return self->_deviceVersion;
}

- (void)setDeviceVersion:(id)a3
{
  objc_storeStrong((id *)&self->_deviceVersion, a3);
}

- (NSString)systemName
{
  return self->_systemName;
}

- (void)setSystemName:(id)a3
{
  objc_storeStrong((id *)&self->_systemName, a3);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_storeStrong((id *)&self->_systemVersion, a3);
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void)setSystemBuild:(id)a3
{
  objc_storeStrong((id *)&self->_systemBuild, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
