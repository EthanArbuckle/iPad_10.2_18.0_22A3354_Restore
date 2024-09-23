@implementation FMDExtAccessoryInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[FMDExtAccessoryInfo accessoryIdentifier](self, "accessoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accessoryIdentifier"));

  -[FMDExtAccessoryInfo accessoryType](self, "accessoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accessoryType"));

  -[FMDExtAccessoryInfo serialNumbers](self, "serialNumbers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serialNumbers"));

  -[FMDExtAccessoryInfo firmwareVersion](self, "firmwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("firmwareVersion"));

  -[FMDExtAccessoryInfo name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("name"));

  -[FMDExtAccessoryInfo additionalInfo](self, "additionalInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("additionalInfo"));

  -[FMDExtAccessoryInfo deviceDiscoveryId](self, "deviceDiscoveryId");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("deviceDiscoveryId"));

}

- (FMDExtAccessoryInfo)initWithCoder:(id)a3
{
  id v4;
  FMDExtAccessoryInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMDExtAccessoryInfo;
  v5 = -[FMDExtAccessoryInfo init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDExtAccessoryInfo setAccessoryIdentifier:](v5, "setAccessoryIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDExtAccessoryInfo setAccessoryType:](v5, "setAccessoryType:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firmwareVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDExtAccessoryInfo setFirmwareVersion:](v5, "setFirmwareVersion:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDExtAccessoryInfo setName:](v5, "setName:", v9);

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("serialNumbers"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDExtAccessoryInfo setSerialNumbers:](v5, "setSerialNumbers:", v14);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("additionalInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDExtAccessoryInfo setAdditionalInfo:](v5, "setAdditionalInfo:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceDiscoveryId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDExtAccessoryInfo setDeviceDiscoveryId:](v5, "setDeviceDiscoveryId:", v16);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FMDExtAccessoryInfo accessoryIdentifier](self, "accessoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDExtAccessoryInfo accessoryType](self, "accessoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDExtAccessoryInfo serialNumbers](self, "serialNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDExtAccessoryInfo firmwareVersion](self, "firmwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDExtAccessoryInfo name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDExtAccessoryInfo additionalInfo](self, "additionalInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDExtAccessoryInfo deviceDiscoveryId](self, "deviceDiscoveryId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("accessory Info = (0x%lx)\n    accessoryIdentifier = %@\n    accessoryType = %@\n    serialNumbers = %@\n    firmwareVersion = %@\n    name = %@\n    additionalInfo = %@\n deviceDiscoveryId = %@\n"), self, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryType, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumbers, a3);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareVersion, a3);
}

- (NSString)deviceDiscoveryId
{
  return self->_deviceDiscoveryId;
}

- (void)setDeviceDiscoveryId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDiscoveryId, a3);
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
  objc_storeStrong((id *)&self->_additionalInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_deviceDiscoveryId, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
