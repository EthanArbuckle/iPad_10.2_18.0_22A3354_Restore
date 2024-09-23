@implementation MBDeviceLockInfo

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
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x1D8270CF0]();
  -[MBDeviceLockInfo deviceUUID](self, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("deviceUUID"));

  -[MBDeviceLockInfo deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("deviceName"));

  -[MBDeviceLockInfo ownerDeviceUUID](self, "ownerDeviceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("ownerDeviceUUID"));

  -[MBDeviceLockInfo ownerDeviceName](self, "ownerDeviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("ownerDeviceName"));

  -[MBDeviceLockInfo creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("creationDate"));

  -[MBDeviceLockInfo expirationDate](self, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("expirationDate"));

  objc_autoreleasePoolPop(v4);
}

- (MBDeviceLockInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MBDeviceLockInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MBDeviceLockInfo *v13;
  objc_super v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8270CF0]();
  v15.receiver = self;
  v15.super_class = (Class)MBDeviceLockInfo;
  v6 = -[MBDeviceLockInfo init](&v15, sel_init);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceLockInfo setDeviceUUID:](v6, "setDeviceUUID:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceLockInfo setDeviceName:](v6, "setDeviceName:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerDeviceUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceLockInfo setOwnerDeviceUUID:](v6, "setOwnerDeviceUUID:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerDeviceName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceLockInfo setOwnerDeviceName:](v6, "setOwnerDeviceName:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceLockInfo setCreationDate:](v6, "setCreationDate:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceLockInfo setExpirationDate:](v6, "setExpirationDate:", v12);

  }
  v13 = v6;
  objc_autoreleasePoolPop(v5);

  return v13;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUID, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)ownerDeviceUUID
{
  return self->_ownerDeviceUUID;
}

- (void)setOwnerDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_ownerDeviceUUID, a3);
}

- (NSString)ownerDeviceName
{
  return self->_ownerDeviceName;
}

- (void)setOwnerDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_ownerDeviceName, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_ownerDeviceName, 0);
  objc_storeStrong((id *)&self->_ownerDeviceUUID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
}

@end
