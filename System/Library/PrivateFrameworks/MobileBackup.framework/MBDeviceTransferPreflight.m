@implementation MBDeviceTransferPreflight

- (MBDeviceTransferPreflight)init
{
  MBDeviceTransferPreflight *v2;
  uint64_t v3;
  NSString *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBDeviceTransferPreflight;
  v2 = -[MBDeviceTransferPreflight init](&v6, sel_init);
  if (v2)
  {
    MBRandomUUID();
    v3 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v3;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBDeviceTransferPreflight)initWithCoder:(id)a3
{
  id v4;
  MBDeviceTransferPreflight *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MBDeviceTransferPreflight;
  v5 = -[MBDeviceTransferPreflight init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceTransferPreflight setUuid:](v5, "setUuid:", v6);

    -[MBDeviceTransferPreflight setSourceDeviceDataSize:](v5, "setSourceDeviceDataSize:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceDeviceDataSize")));
    -[MBDeviceTransferPreflight setTargetDeviceFreeSpaceSize:](v5, "setTargetDeviceFreeSpaceSize:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("targetDeviceFreeSpaceSize")));
    -[MBDeviceTransferPreflight setSourcePurgeableSpaceSize:](v5, "setSourcePurgeableSpaceSize:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourcePurgeableSpaceSize")));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("appleIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceTransferPreflight setAppleIDs:](v5, "setAppleIDs:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeAppleID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceTransferPreflight setActiveAppleID:](v5, "setActiveAppleID:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MBDeviceTransferPreflight uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[MBDeviceTransferPreflight sourceDeviceDataSize](self, "sourceDeviceDataSize"), CFSTR("sourceDeviceDataSize"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[MBDeviceTransferPreflight targetDeviceFreeSpaceSize](self, "targetDeviceFreeSpaceSize"), CFSTR("targetDeviceFreeSpaceSize"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[MBDeviceTransferPreflight sourcePurgeableSpaceSize](self, "sourcePurgeableSpaceSize"), CFSTR("sourcePurgeableSpaceSize"));
  -[MBDeviceTransferPreflight appleIDs](self, "appleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("appleIDs"));

  -[MBDeviceTransferPreflight activeAppleID](self, "activeAppleID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("activeAppleID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MBDeviceTransferPreflight uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUuid:", v6);

  objc_msgSend(v4, "setSourceDeviceDataSize:", -[MBDeviceTransferPreflight sourceDeviceDataSize](self, "sourceDeviceDataSize"));
  objc_msgSend(v4, "setTargetDeviceFreeSpaceSize:", -[MBDeviceTransferPreflight targetDeviceFreeSpaceSize](self, "targetDeviceFreeSpaceSize"));
  objc_msgSend(v4, "setSourcePurgeableSpaceSize:", -[MBDeviceTransferPreflight sourcePurgeableSpaceSize](self, "sourcePurgeableSpaceSize"));
  -[MBDeviceTransferPreflight appleIDs](self, "appleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppleIDs:", v7);

  -[MBDeviceTransferPreflight activeAppleID](self, "activeAppleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActiveAppleID:", v8);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  const char *Name;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  -[MBDeviceTransferPreflight uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s: %p; uuid=%@, sourceDeviceDataSize=%llu, sourcePurgeableSpaceSize=%llu, targetDeviceFreeSpaceSize=%llu>"),
    Name,
    self,
    v6,
    -[MBDeviceTransferPreflight sourceDeviceDataSize](self, "sourceDeviceDataSize"),
    -[MBDeviceTransferPreflight sourcePurgeableSpaceSize](self, "sourcePurgeableSpaceSize"),
    -[MBDeviceTransferPreflight targetDeviceFreeSpaceSize](self, "targetDeviceFreeSpaceSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)sourceDeviceDataSize
{
  return self->_sourceDeviceDataSize;
}

- (void)setSourceDeviceDataSize:(unint64_t)a3
{
  self->_sourceDeviceDataSize = a3;
}

- (unint64_t)targetDeviceFreeSpaceSize
{
  return self->_targetDeviceFreeSpaceSize;
}

- (void)setTargetDeviceFreeSpaceSize:(unint64_t)a3
{
  self->_targetDeviceFreeSpaceSize = a3;
}

- (unint64_t)sourcePurgeableSpaceSize
{
  return self->_sourcePurgeableSpaceSize;
}

- (void)setSourcePurgeableSpaceSize:(unint64_t)a3
{
  self->_sourcePurgeableSpaceSize = a3;
}

- (NSString)activeAppleID
{
  return self->_activeAppleID;
}

- (void)setActiveAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_activeAppleID, a3);
}

- (NSDictionary)appleIDs
{
  return self->_appleIDs;
}

- (void)setAppleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDs, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_appleIDs, 0);
  objc_storeStrong((id *)&self->_activeAppleID, 0);
}

@end
