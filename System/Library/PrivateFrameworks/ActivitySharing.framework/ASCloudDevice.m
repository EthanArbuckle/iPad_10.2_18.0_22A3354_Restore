@implementation ASCloudDevice

+ (id)cloudDeviceWithRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ASCloudDevice *v11;
  void *v12;
  void *v13;
  ASCloudDevice *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "valuesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceOSBuild"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "valuesByKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeviceOSVersionNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "valuesByKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DeviceOSType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v3, "modificationDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = [ASCloudDevice alloc];
          objc_msgSend(v3, "recordID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "recordName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[ASCloudDevice initWithBuildNumber:deviceType:identifier:modificationDate:osVersion:](v11, "initWithBuildNumber:deviceType:identifier:modificationDate:osVersion:", v5, v9, v13, v10, v7);

        }
        else
        {
          ASLoggingInitialize();
          if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
            +[ASCloudDevice(CloudKitCodingSupport) cloudDeviceWithRecord:].cold.4();
          v14 = 0;
        }

      }
      else
      {
        ASLoggingInitialize();
        v17 = (void *)ASLogCloudKit;
        if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
          +[ASCloudDevice(CloudKitCodingSupport) cloudDeviceWithRecord:].cold.3(v17);
        v14 = 0;
      }

    }
    else
    {
      ASLoggingInitialize();
      v16 = (void *)ASLogCloudKit;
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
        +[ASCloudDevice(CloudKitCodingSupport) cloudDeviceWithRecord:].cold.2(v16);
      v14 = 0;
    }

  }
  else
  {
    ASLoggingInitialize();
    v15 = (void *)ASLogCloudKit;
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
      +[ASCloudDevice(CloudKitCodingSupport) cloudDeviceWithRecord:].cold.1(v15);
    v14 = 0;
  }

  return v14;
}

- (ASCloudDevice)initWithBuildNumber:(id)a3 deviceType:(id)a4 identifier:(id)a5 modificationDate:(id)a6 osVersion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ASCloudDevice *v17;
  ASCloudDevice *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ASCloudDevice;
  v17 = -[ASCloudDevice init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_buildNumber, a3);
    objc_storeStrong((id *)&v18->_deviceType, a4);
    objc_storeStrong((id *)&v18->_identifier, a5);
    objc_storeStrong((id *)&v18->_modificationDate, a6);
    objc_storeStrong((id *)&v18->_osVersion, a7);
  }

  return v18;
}

- (ASCloudDevice)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ASCloudDevice *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buildNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modificationDate"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osVersion"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            self = -[ASCloudDevice initWithBuildNumber:deviceType:identifier:modificationDate:osVersion:](self, "initWithBuildNumber:deviceType:identifier:modificationDate:osVersion:", v5, v6, v7, v8, v9);
            v10 = self;
          }
          else
          {
            v10 = 0;
          }

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  NSString *deviceType;
  __int128 v3;
  _QWORD v5[5];
  _QWORD v6[2];
  __int128 v7;
  NSString *osVersion;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("buildNumber");
  v5[1] = CFSTR("deviceType");
  deviceType = self->_deviceType;
  v6[0] = self->_buildNumber;
  v6[1] = deviceType;
  v3 = *(_OWORD *)&self->_identifier;
  v5[2] = CFSTR("identifier");
  v5[3] = CFSTR("modificationDate");
  v7 = v3;
  v5[4] = CFSTR("osVersion");
  osVersion = self->_osVersion;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Device (%@), build: %@, type: %@, mod date: %@, OS: %@"), self->_identifier, self->_buildNumber, self->_deviceType, self->_modificationDate, self->_osVersion);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self == a3)
    return 1;
  v4 = a3;
  -[ASCloudDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ASCloudDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *buildNumber;
  id v5;

  buildNumber = self->_buildNumber;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", buildNumber, CFSTR("buildNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("modificationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_osVersion, CFSTR("osVersion"));

}

- (ASCloudDevice)initWithCoder:(id)a3
{
  id v4;
  ASCloudDevice *v5;
  uint64_t v6;
  NSString *buildNumber;
  uint64_t v8;
  NSString *deviceType;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSDate *modificationDate;
  uint64_t v14;
  NSString *osVersion;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASCloudDevice;
  v5 = -[ASCloudDevice init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buildNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    buildNumber = v5->_buildNumber;
    v5->_buildNumber = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceType"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modificationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_buildNumber, 0);
}

@end
