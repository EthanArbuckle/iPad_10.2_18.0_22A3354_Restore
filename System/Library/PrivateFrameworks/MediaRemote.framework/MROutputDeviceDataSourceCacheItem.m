@implementation MROutputDeviceDataSourceCacheItem

- (MROutputDeviceDataSourceCacheItem)initWithDataSource:(id)a3
{
  id v5;
  MROutputDeviceDataSourceCacheItem *v6;
  MROutputDeviceDataSourceCacheItem *v7;
  uint64_t v8;
  NSHashTable *controllers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MROutputDeviceDataSourceCacheItem;
  v6 = -[MROutputDeviceDataSourceCacheItem init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    controllers = v7->_controllers;
    v7->_controllers = (NSHashTable *)v8;

  }
  return v7;
}

- (MROutputDeviceDataSource)dataSource
{
  return self->_dataSource;
}

- (NSHashTable)controllers
{
  return self->_controllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
