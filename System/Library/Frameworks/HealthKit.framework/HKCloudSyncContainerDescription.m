@implementation HKCloudSyncContainerDescription

- (HKCloudSyncContainerDescription)initWithContainerIdentifier:(id)a3 deviceIdentifier:(id)a4 databaseDescriptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKCloudSyncContainerDescription *v11;
  uint64_t v12;
  NSString *containerIdentifier;
  uint64_t v14;
  NSString *deviceIdentifier;
  uint64_t v16;
  NSArray *databaseDescriptions;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKCloudSyncContainerDescription;
  v11 = -[HKCloudSyncContainerDescription init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    containerIdentifier = v11->_containerIdentifier;
    v11->_containerIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    deviceIdentifier = v11->_deviceIdentifier;
    v11->_deviceIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    databaseDescriptions = v11->_databaseDescriptions;
    v11->_databaseDescriptions = (NSArray *)v16;

  }
  return v11;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Container Identifier: %@,Device Identifier: %@,Databases: \n %@"), self->_containerIdentifier, self->_deviceIdentifier, self->_databaseDescriptions);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *containerIdentifier;
  id v5;

  containerIdentifier = self->_containerIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", containerIdentifier, CFSTR("ContainerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("DeviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_databaseDescriptions, CFSTR("DatabaseDescriptions"));

}

- (HKCloudSyncContainerDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKCloudSyncContainerDescription *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContainerIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("DatabaseDescriptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKCloudSyncContainerDescription initWithContainerIdentifier:deviceIdentifier:databaseDescriptions:](self, "initWithContainerIdentifier:deviceIdentifier:databaseDescriptions:", v5, v6, v10);
  return v11;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSArray)databaseDescriptions
{
  return self->_databaseDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseDescriptions, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
