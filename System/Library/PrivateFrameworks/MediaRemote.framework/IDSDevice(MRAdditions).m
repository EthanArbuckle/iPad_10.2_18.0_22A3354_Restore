@implementation IDSDevice(MRAdditions)

- (MRDeviceInfo)mr_deviceInfo
{
  MRDeviceInfo *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MRDeviceInfo);
  objc_msgSend(a1, "uniqueIDOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo setDeviceUID:](v2, "setDeviceUID:", v3);

  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo setName:](v2, "setName:", v4);

  objc_msgSend(a1, "modelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo setModelID:](v2, "setModelID:", v5);

  -[MRDeviceInfo setDeviceClass:](v2, "setDeviceClass:", objc_msgSend(a1, "mr_deviceClass"));
  return v2;
}

- (MRAVDistantOutputDevice)mr_outputDevice
{
  _MRAVOutputDeviceDescriptorProtobuf *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MRAVDistantOutputDevice *v7;

  v2 = objc_alloc_init(_MRAVOutputDeviceDescriptorProtobuf);
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setName:](v2, "setName:", v3);

  objc_msgSend(a1, "uniqueIDOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setUniqueIdentifier:](v2, "setUniqueIdentifier:", v4);

  objc_msgSend(a1, "modelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setModelID:](v2, "setModelID:", v5);

  objc_msgSend(a1, "uniqueIDOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAVOutputDeviceDescriptorProtobuf setGroupID:](v2, "setGroupID:", v6);

  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceSubType:](v2, "setDeviceSubType:", objc_msgSend(a1, "mr_deviceSubType"));
  -[_MRAVOutputDeviceDescriptorProtobuf setDeviceType:](v2, "setDeviceType:", 4);
  -[_MRAVOutputDeviceDescriptorProtobuf setIsRemoteControllable:](v2, "setIsRemoteControllable:", 1);
  -[_MRAVOutputDeviceDescriptorProtobuf setIsGroupLeader:](v2, "setIsGroupLeader:", 1);
  -[_MRAVOutputDeviceDescriptorProtobuf setGroupContainsGroupLeader:](v2, "setGroupContainsGroupLeader:", 1);
  -[_MRAVOutputDeviceDescriptorProtobuf setTransportType:](v2, "setTransportType:", 4);
  -[_MRAVOutputDeviceDescriptorProtobuf setHostDeviceClass:](v2, "setHostDeviceClass:", _MRDeviceInfoMessageProtobuf_DeviceClassFromModel(objc_msgSend(a1, "mr_deviceClass")));
  v7 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v2);

  return v7;
}

- (uint64_t)mr_deviceClass
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "deviceType");
  if ((unint64_t)(v1 - 1) > 6)
    return 0;
  else
    return qword_193AD9438[v1 - 1];
}

- (uint64_t)mr_deviceSubType
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "deviceType");
  if ((unint64_t)(v1 - 1) > 6)
    return 0;
  else
    return dword_193AD9470[v1 - 1];
}

@end
