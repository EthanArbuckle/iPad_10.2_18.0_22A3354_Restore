@implementation HDDeviceKeyValueStorageGroup

- (HDDeviceKeyValueStorageGroup)initWithDeviceContext:(id)a3 storageEntries:(id)a4
{
  id v7;
  id v8;
  HDDeviceKeyValueStorageGroup *v9;
  HDDeviceKeyValueStorageGroup *v10;
  uint64_t v11;
  NSArray *storageEntries;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDDeviceKeyValueStorageGroup;
  v9 = -[HDDeviceKeyValueStorageGroup init](&v14, sel_init);
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

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HDDeviceKeyValueStorageGroup initWithDeviceContext:storageEntries:](+[HDDeviceKeyValueStorageGroup allocWithZone:](HDDeviceKeyValueStorageGroup, "allocWithZone:", a3), "initWithDeviceContext:storageEntries:", self->_deviceContext, self->_storageEntries);
}

- (HDDeviceContext)deviceContext
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
