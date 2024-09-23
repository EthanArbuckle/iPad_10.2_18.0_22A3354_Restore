@implementation HKDeviceKeyValueStorageGroup

- (HKDeviceKeyValueStorageGroup)initWithDeviceContext:(id)a3 storageEntries:(id)a4
{
  id v7;
  id v8;
  HKDeviceKeyValueStorageGroup *v9;
  HKDeviceKeyValueStorageGroup *v10;
  uint64_t v11;
  NSArray *storageEntries;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKDeviceKeyValueStorageGroup;
  v9 = -[HKDeviceKeyValueStorageGroup init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceContext, a3);
    v11 = objc_msgSend(v8, "copy");
    storageEntries = v10->_storageEntries;
    v10->_storageEntries = (NSArray *)v11;

  }
  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p context:%@ entries:%@"), objc_opt_class(), self, self->_deviceContext, self->_storageEntries);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKDeviceKeyValueStorageGroup initWithDeviceContext:storageEntries:](+[HKDeviceKeyValueStorageGroup allocWithZone:](HKDeviceKeyValueStorageGroup, "allocWithZone:", a3), "initWithDeviceContext:storageEntries:", self->_deviceContext, self->_storageEntries);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKDeviceContext *deviceContext;
  id v5;

  deviceContext = self->_deviceContext;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceContext, CFSTR("DeviceContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storageEntries, CFSTR("StorageEntries"));

}

- (HKDeviceKeyValueStorageGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HKDeviceKeyValueStorageGroup *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("StorageEntries"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v5 && v9)
  {
    self = -[HKDeviceKeyValueStorageGroup initWithDeviceContext:storageEntries:](self, "initWithDeviceContext:storageEntries:", v5, v9);
    v10 = self;
  }

  return v10;
}

- (HKDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (NSArray)storageEntries
{
  return self->_storageEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageEntries, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
}

@end
