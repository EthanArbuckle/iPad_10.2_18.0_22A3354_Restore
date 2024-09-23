@implementation MSPSharedTripVirtualContact

- (MSPSharedTripVirtualContact)initWithVirtualReceiverHandle:(id)a3
{
  id v5;
  MSPSharedTripVirtualContact *v6;
  MSPSharedTripVirtualContact *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *deviceHandlesByVersion;

  v5 = a3;
  v6 = -[MSPSharedTripVirtualContact init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_virtualReceiverHandle, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceHandlesByVersion = v7->_deviceHandlesByVersion;
    v7->_deviceHandlesByVersion = v8;

  }
  return v7;
}

- (BOOL)isPhoneNumber
{
  return 0;
}

- (id)displayName
{
  NSString *virtualReceiverName;
  NSString *v4;
  NSString *v5;

  virtualReceiverName = self->_virtualReceiverName;
  if (!virtualReceiverName)
  {
    MSPSharedTripVirtualReceiverHandleGetName(self->_virtualReceiverHandle);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_virtualReceiverName;
    self->_virtualReceiverName = v4;

    virtualReceiverName = self->_virtualReceiverName;
  }
  return virtualReceiverName;
}

- (id)stringValue
{
  return self->_virtualReceiverHandle;
}

- (id)handleForIDS
{
  return self->_virtualReceiverHandle;
}

- (id)contact
{
  return 0;
}

- (id)labeledValue
{
  return 0;
}

- (id)_deviceHandleForVersion:(unint64_t)a3
{
  NSMutableDictionary *deviceHandlesByVersion;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;

  deviceHandlesByVersion = self->_deviceHandlesByVersion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](deviceHandlesByVersion, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    MSPSharedTripVirturalReceiverDeviceHandleMake(self->_virtualReceiverHandle, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_deviceHandlesByVersion;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHandlesByVersion, 0);
  objc_storeStrong((id *)&self->_virtualReceiverName, 0);
  objc_storeStrong((id *)&self->_virtualReceiverHandle, 0);
}

@end
