@implementation GTServiceProperties

+ (id)protocolMethods:(id)a3
{
  objc_method_description *v3;
  id v4;
  void *v5;
  unint64_t v6;
  const char **p_name;
  const char *v8;
  void *v9;
  void *v10;
  unsigned int outCount;

  outCount = 0;
  v3 = protocol_copyMethodDescriptionList((Protocol *)a3, 1, 1, &outCount);
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v5 = (void *)objc_msgSend(v4, "initWithCapacity:", outCount);
  if (outCount)
  {
    v6 = 0;
    p_name = &v3->name;
    do
    {
      v8 = *p_name;
      p_name += 2;
      NSStringFromSelector(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

      ++v6;
    }
    while (v6 < outCount);
  }
  free(v3);
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTServiceProperties)initWithProtocol:(id)a3
{
  Protocol *v4;
  GTServiceProperties *v5;
  uint64_t v6;
  NSString *protocolName;
  uint64_t v8;
  NSArray *protocolMethods;
  NSString *deviceUDID;
  objc_super v12;

  v4 = (Protocol *)a3;
  v12.receiver = self;
  v12.super_class = (Class)GTServiceProperties;
  v5 = -[GTServiceProperties init](&v12, sel_init);
  if (v5)
  {
    NSStringFromProtocol(v4);
    v6 = objc_claimAutoreleasedReturnValue();
    protocolName = v5->_protocolName;
    v5->_protocolName = (NSString *)v6;

    +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = (NSArray *)v8;

    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = 0;

    v5->_platform = GTCorePlatformGet();
    v5->_version = 0;
  }

  return v5;
}

- (GTServiceProperties)initWithCoder:(id)a3
{
  id v4;
  GTServiceProperties *v5;
  uint64_t v6;
  NSString *protocolName;
  NSString *v8;
  uint64_t v9;
  NSArray *protocolMethods;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSArray *v16;
  uint64_t v17;
  NSString *deviceUDID;
  NSString *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GTServiceProperties;
  v5 = -[GTServiceProperties init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protocolName"));
    v6 = objc_claimAutoreleasedReturnValue();
    protocolName = v5->_protocolName;
    v5->_protocolName = (NSString *)v6;

    if (v5->_protocolName)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = v5->_protocolName;
        v5->_protocolName = 0;

      }
    }
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("protocolMethods"));
    v9 = objc_claimAutoreleasedReturnValue();
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = (NSArray *)v9;

    if (v5->_protocolMethods)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v11 = v5->_protocolMethods;
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v16 = v5->_protocolMethods;
                v5->_protocolMethods = 0;

                goto LABEL_18;
              }
            }
            v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
            if (v13)
              continue;
            break;
          }
        }
      }
      else
      {
        v11 = v5->_protocolMethods;
        v5->_protocolMethods = 0;
      }
LABEL_18:

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceUDID"));
    v17 = objc_claimAutoreleasedReturnValue();
    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v17;

    if (v5->_deviceUDID)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = v5->_deviceUDID;
        v5->_deviceUDID = 0;

      }
    }
    v5->_servicePort = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("servicePort"), v21);
    v5->_platform = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("platform"));
    v5->_version = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("version"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *protocolName;
  id v5;

  protocolName = self->_protocolName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", protocolName, CFSTR("protocolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_protocolMethods, CFSTR("protocolMethods"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_servicePort, CFSTR("servicePort"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_platform, CFSTR("platform"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceUDID, CFSTR("deviceUDID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_version, CFSTR("version"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  GTServiceProperties *v4;
  void *v5;

  v4 = objc_alloc_init(GTServiceProperties);
  -[GTServiceProperties setProtocolName:](v4, "setProtocolName:", self->_protocolName);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_protocolMethods, 1);
  -[GTServiceProperties setProtocolMethods:](v4, "setProtocolMethods:", v5);

  -[GTServiceProperties setServicePort:](v4, "setServicePort:", self->_servicePort);
  -[GTServiceProperties setPlatform:](v4, "setPlatform:", self->_platform);
  -[GTServiceProperties setDeviceUDID:](v4, "setDeviceUDID:", self->_deviceUDID);
  -[GTServiceProperties setVersion:](v4, "setVersion:", self->_version);
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: protocolName=%@ protocolMethods=%@ servicePort=%llu platform=%u deviceUDID=%@ version=%llu>"), v5, self->_protocolName, self->_protocolMethods, self->_servicePort, self->_platform, self->_deviceUDID, self->_version);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (void)setProtocolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)protocolMethods
{
  return self->_protocolMethods;
}

- (void)setProtocolMethods:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)servicePort
{
  return self->_servicePort;
}

- (void)setServicePort:(unint64_t)a3
{
  self->_servicePort = a3;
}

- (int)platform
{
  return self->_platform;
}

- (void)setPlatform:(int)a3
{
  self->_platform = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_protocolMethods, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
}

@end
