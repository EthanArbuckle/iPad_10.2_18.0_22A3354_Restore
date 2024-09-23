@implementation MRVolumeControlCapabilitiesDidChangeMessage

- (MRVolumeControlCapabilitiesDidChangeMessage)initWithCapabilities:(unsigned int)a3 endpointUID:(id)a4 outputDeviceUID:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  MRVolumeControlCapabilitiesDidChangeMessage *v10;
  _MRVolumeControlCapabilitiesDidChangeMessageProtobuf *v11;
  void *v12;
  objc_super v14;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRVolumeControlCapabilitiesDidChangeMessage;
  v10 = -[MRProtocolMessage init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf);
    MRCapabilitiesToProtobuf(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setCapabilities:](v11, "setCapabilities:", v12);

    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setEndpointUID:](v11, "setEndpointUID:", v8);
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setOutputDeviceUID:](v11, "setOutputDeviceUID:", v9);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v10, "setUnderlyingCodableMessage:", v11);

  }
  return v10;
}

- (unsigned)capabilities
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MRCapabilitiesFromProtobuf(v3);

  return v4;
}

- (NSString)endpointUID
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)outputDeviceUID
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDeviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 64;
}

@end
