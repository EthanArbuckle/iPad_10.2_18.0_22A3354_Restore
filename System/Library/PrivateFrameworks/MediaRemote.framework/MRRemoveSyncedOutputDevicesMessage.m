@implementation MRRemoveSyncedOutputDevicesMessage

- (MRRemoveSyncedOutputDevicesMessage)initWithOutputDeviceUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  MRRemoveSyncedOutputDevicesMessage *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[MRRemoveSyncedOutputDevicesMessage initWithOutputDeviceUIDs:](self, "initWithOutputDeviceUIDs:", v6, v9, v10);
    self = v7;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MRRemoveSyncedOutputDevicesMessage)initWithOutputDeviceUIDs:(id)a3
{
  id v4;
  MRRemoveSyncedOutputDevicesMessage *v5;
  _MRRemoveOutputDevicesMessageProtobuf *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRRemoveSyncedOutputDevicesMessage;
  v5 = -[MRProtocolMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRRemoveOutputDevicesMessageProtobuf);
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    -[_MRRemoveOutputDevicesMessageProtobuf setOutputDeviceUIDs:](v6, "setOutputDeviceUIDs:", v7);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);
  }

  return v5;
}

- (NSArray)outputDeviceUIDs
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDeviceUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)type
{
  return 66;
}

@end
