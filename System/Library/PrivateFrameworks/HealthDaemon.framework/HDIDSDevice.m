@implementation HDIDSDevice

- (HDIDSDevice)initWithIdentifier:(id)a3 name:(id)a4 destinationID:(id)a5 deviceType:(int64_t)a6 buildVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HDIDSDevice *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSString *name;
  uint64_t v21;
  NSString *destinationID;
  uint64_t v23;
  NSString *buildVersion;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HDIDSDevice;
  v16 = -[HDIDSDevice init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    destinationID = v16->_destinationID;
    v16->_destinationID = (NSString *)v21;

    v16->_deviceType = a6;
    v23 = objc_msgSend(v15, "copy");
    buildVersion = v16->_buildVersion;
    v16->_buildVersion = (NSString *)v23;

  }
  return v16;
}

- (HDIDSDevice)initWithIDSDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HDIDSDevice *v10;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)IDSCopyIDForDevice();
    v8 = objc_msgSend(v4, "deviceType");
    objc_msgSend(v4, "productBuildVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[HDIDSDevice initWithIdentifier:name:destinationID:deviceType:buildVersion:](self, "initWithIdentifier:name:destinationID:deviceType:buildVersion:", v5, v6, v7, v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HDIDSDevice *v4;
  HDIDSDevice *v5;
  NSString *identifier;
  NSString *v7;
  NSString *name;
  NSString *v9;
  NSString *destinationID;
  NSString *v11;
  NSString *buildVersion;
  NSString *v13;
  char v14;

  v4 = (HDIDSDevice *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier != v7 && (!v7 || !-[NSString isEqualToString:](identifier, "isEqualToString:")))
        goto LABEL_18;
      name = self->_name;
      v9 = v5->_name;
      if (name != v9 && (!v9 || !-[NSString isEqualToString:](name, "isEqualToString:")))
        goto LABEL_18;
      destinationID = self->_destinationID;
      v11 = v5->_destinationID;
      if (destinationID != v11 && (!v11 || !-[NSString isEqualToString:](destinationID, "isEqualToString:")))
        goto LABEL_18;
      if (self->_deviceType != v5->_deviceType)
        goto LABEL_18;
      buildVersion = self->_buildVersion;
      v13 = v5->_buildVersion;
      if (buildVersion == v13)
      {
        v14 = 1;
        goto LABEL_19;
      }
      if (v13)
        v14 = -[NSString isEqualToString:](buildVersion, "isEqualToString:");
      else
LABEL_18:
        v14 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v14 = 0;
  }
LABEL_20:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSString *buildVersion;
  int64_t v7;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = -[NSString hash](self->_destinationID, "hash");
  buildVersion = self->_buildVersion;
  v7 = v4 ^ v5 ^ self->_deviceType;
  return v7 ^ -[NSString hash](buildVersion, "hash");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
