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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo accessoryIdentifier](self, "accessoryIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accessoryIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo accessoryType](self, "accessoryType"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accessoryType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo serialNumbers](self, "serialNumbers"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serialNumbers"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo firmwareVersion](self, "firmwareVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("firmwareVersion"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo name](self, "name"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("name"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo additionalInfo](self, "additionalInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("additionalInfo"));

  v11 = (id)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo deviceDiscoveryId](self, "deviceDiscoveryId"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("deviceDiscoveryId"));

}

- (FMDExtAccessoryInfo)initWithCoder:(id)a3
{
  id v4;
  FMDExtAccessoryInfo *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FMDExtAccessoryInfo;
  v5 = -[FMDExtAccessoryInfo init](&v23, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("accessoryIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[FMDExtAccessoryInfo setAccessoryIdentifier:](v5, "setAccessoryIdentifier:", v7);

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("accessoryType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[FMDExtAccessoryInfo setAccessoryType:](v5, "setAccessoryType:", v9);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("firmwareVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[FMDExtAccessoryInfo setFirmwareVersion:](v5, "setFirmwareVersion:", v11);

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[FMDExtAccessoryInfo setName:](v5, "setName:", v13);

    v14 = objc_opt_class(NSString);
    v15 = objc_opt_class(NSDictionary);
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v15, objc_opt_class(NSNumber), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("serialNumbers")));
    -[FMDExtAccessoryInfo setSerialNumbers:](v5, "setSerialNumbers:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("additionalInfo")));
    -[FMDExtAccessoryInfo setAdditionalInfo:](v5, "setAdditionalInfo:", v19);

    v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("deviceDiscoveryId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[FMDExtAccessoryInfo setDeviceDiscoveryId:](v5, "setDeviceDiscoveryId:", v21);

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo accessoryIdentifier](self, "accessoryIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo accessoryType](self, "accessoryType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo serialNumbers](self, "serialNumbers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo firmwareVersion](self, "firmwareVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo name](self, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo additionalInfo](self, "additionalInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryInfo deviceDiscoveryId](self, "deviceDiscoveryId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("accessory Info = (0x%lx)\n    accessoryIdentifier = %@\n    accessoryType = %@\n    serialNumbers = %@\n    firmwareVersion = %@\n    name = %@\n    additionalInfo = %@\n deviceDiscoveryId = %@\n"), self, v3, v4, v5, v6, v7, v8, v9));

  return v10;
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
