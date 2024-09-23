@implementation MRVolumeDidChangeMessage

- (MRVolumeDidChangeMessage)initWithVolume:(float)a3 endpointUID:(id)a4 outputDeviceUID:(id)a5
{
  id v8;
  id v9;
  MRVolumeDidChangeMessage *v10;
  _MRVolumeDidChangeMessageProtobuf *v11;
  double v12;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRVolumeDidChangeMessage;
  v10 = -[MRProtocolMessage init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(_MRVolumeDidChangeMessageProtobuf);
    *(float *)&v12 = a3;
    -[_MRVolumeDidChangeMessageProtobuf setVolume:](v11, "setVolume:", v12);
    -[_MRVolumeDidChangeMessageProtobuf setEndpointUID:](v11, "setEndpointUID:", v8);
    -[_MRVolumeDidChangeMessageProtobuf setOutputDeviceUID:](v11, "setOutputDeviceUID:", v9);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v10, "setUnderlyingCodableMessage:", v11);

  }
  return v10;
}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

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
  return 52;
}

@end
