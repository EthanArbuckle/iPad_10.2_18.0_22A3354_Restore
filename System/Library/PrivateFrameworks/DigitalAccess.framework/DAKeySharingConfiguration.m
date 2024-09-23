@implementation DAKeySharingConfiguration

- (DAKeySharingConfiguration)initWithProfile:(unint64_t)a3 displayName:(id)a4 metaData:(id)a5 targetDeviceType:(int64_t)a6
{
  id v11;
  id v12;
  DAKeySharingConfiguration *v13;
  DAKeySharingConfiguration *v14;
  NSString *deviceEnteredPasscode;
  NSString *proprietaryEntitlements;
  objc_super v18;

  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)DAKeySharingConfiguration;
  v13 = -[DAKeySharingConfiguration init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_profile = a3;
    objc_storeStrong((id *)&v13->_displayName, a4);
    objc_storeStrong((id *)&v14->_metaData, a5);
    v14->_enableVehicleEnteredPasscode = 0;
    v14->_targetDeviceType = a6;
    v14->_maxRetriesForDeviceEnteredPasscode = 0;
    deviceEnteredPasscode = v14->_deviceEnteredPasscode;
    v14->_deviceEnteredPasscode = 0;

    proprietaryEntitlements = v14->_proprietaryEntitlements;
    v14->_proprietaryEntitlements = 0;

    v14->_mockRefreshInstanceCA = 0;
  }

  return v14;
}

- (DAKeySharingConfiguration)initWithProfile:(unint64_t)a3 displayName:(id)a4 metaData:(id)a5 targetDeviceType:(int64_t)a6 enableVehiclePasscode:(BOOL)a7 maxRetriesForDevicePasscode:(unint64_t)a8 deviceEnteredPasscode:(id)a9 proprietaryEntitlements:(id)a10
{
  id v15;
  id v16;
  id v17;
  DAKeySharingConfiguration *v18;
  DAKeySharingConfiguration *v19;
  id v23;
  objc_super v24;

  v23 = a4;
  v15 = a5;
  v16 = a9;
  v17 = a10;
  v24.receiver = self;
  v24.super_class = (Class)DAKeySharingConfiguration;
  v18 = -[DAKeySharingConfiguration init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_profile = a3;
    objc_storeStrong((id *)&v18->_displayName, a4);
    objc_storeStrong((id *)&v19->_metaData, a5);
    v19->_enableVehicleEnteredPasscode = a7;
    v19->_targetDeviceType = a6;
    v19->_maxRetriesForDeviceEnteredPasscode = a8;
    objc_storeStrong((id *)&v19->_deviceEnteredPasscode, a9);
    objc_storeStrong((id *)&v19->_proprietaryEntitlements, a10);
    v19->_mockRefreshInstanceCA = 0;
    v19->_keyRole = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[DAKeySharingConfiguration profile](self, "profile"), CFSTR("profile"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[DAKeySharingConfiguration keyRole](self, "keyRole"), CFSTR("keyRole"));
  -[DAKeySharingConfiguration displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("displayName"));

  -[DAKeySharingConfiguration metaData](self, "metaData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("metaData"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[DAKeySharingConfiguration targetDeviceType](self, "targetDeviceType"), CFSTR("targetDeviceType"));
  objc_msgSend(v8, "encodeBool:forKey:", -[DAKeySharingConfiguration enableVehicleEnteredPasscode](self, "enableVehicleEnteredPasscode"), CFSTR("enableVehicleEnteredPasscode"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[DAKeySharingConfiguration maxRetriesForDeviceEnteredPasscode](self, "maxRetriesForDeviceEnteredPasscode"), CFSTR("maxRetriesForDeviceEnteredPasscode"));
  -[DAKeySharingConfiguration deviceEnteredPasscode](self, "deviceEnteredPasscode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("deviceEnteredPasscode"));

  -[DAKeySharingConfiguration proprietaryEntitlements](self, "proprietaryEntitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("proprietaryEntitlements"));

  objc_msgSend(v8, "encodeBool:forKey:", -[DAKeySharingConfiguration mockRefreshInstanceCA](self, "mockRefreshInstanceCA"), CFSTR("mockRefreshInstanceCA"));
}

- (DAKeySharingConfiguration)initWithCoder:(id)a3
{
  id v4;
  DAKeySharingConfiguration *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSData *metaData;
  uint64_t v10;
  NSString *deviceEnteredPasscode;
  uint64_t v12;
  NSString *proprietaryEntitlements;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAKeySharingConfiguration;
  v5 = -[DAKeySharingConfiguration init](&v15, sel_init);
  if (v5)
  {
    v5->_profile = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("profile"));
    v5->_keyRole = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("keyRole"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metaData"));
    v8 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (NSData *)v8;

    v5->_targetDeviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("targetDeviceType"));
    v5->_enableVehicleEnteredPasscode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableVehicleEnteredPasscode"));
    v5->_maxRetriesForDeviceEnteredPasscode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxRetriesForDeviceEnteredPasscode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceEnteredPasscode"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceEnteredPasscode = v5->_deviceEnteredPasscode;
    v5->_deviceEnteredPasscode = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proprietaryEntitlements"));
    v12 = objc_claimAutoreleasedReturnValue();
    proprietaryEntitlements = v5->_proprietaryEntitlements;
    v5->_proprietaryEntitlements = (NSString *)v12;

    v5->_mockRefreshInstanceCA = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mockRefreshInstanceCA"));
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
  void *v12;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sharing Profile       : %ld\n"), self->_profile);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Key Role              : %ld\n"), self->_keyRole);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Display Name          : %@\n"), self->_displayName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Meta Data             : %@\n"), self->_metaData);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Target Device         : %ld\n"), self->_targetDeviceType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Enable VEP            : %d\n"), self->_enableVehicleEnteredPasscode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v9);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Max PIN retries       : %ld\n"), self->_maxRetriesForDeviceEnteredPasscode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PIN length            : %lu\n"), -[NSString length](self->_deviceEnteredPasscode, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v11);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Prop. Entitlements    : %@\n"), self->_proprietaryEntitlements);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v12);

  if (self->_mockRefreshInstanceCA)
    objc_msgSend(v3, "appendString:", CFSTR("Mock Refresh of Instance CA requested"));
  return v3;
}

- (unint64_t)profile
{
  return self->_profile;
}

- (unint64_t)keyRole
{
  return self->_keyRole;
}

- (void)setKeyRole:(unint64_t)a3
{
  self->_keyRole = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSData)metaData
{
  return self->_metaData;
}

- (int64_t)targetDeviceType
{
  return self->_targetDeviceType;
}

- (BOOL)enableVehicleEnteredPasscode
{
  return self->_enableVehicleEnteredPasscode;
}

- (unint64_t)maxRetriesForDeviceEnteredPasscode
{
  return self->_maxRetriesForDeviceEnteredPasscode;
}

- (NSString)deviceEnteredPasscode
{
  return self->_deviceEnteredPasscode;
}

- (NSString)proprietaryEntitlements
{
  return self->_proprietaryEntitlements;
}

- (BOOL)mockRefreshInstanceCA
{
  return self->_mockRefreshInstanceCA;
}

- (void)setMockRefreshInstanceCA:(BOOL)a3
{
  self->_mockRefreshInstanceCA = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proprietaryEntitlements, 0);
  objc_storeStrong((id *)&self->_deviceEnteredPasscode, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
