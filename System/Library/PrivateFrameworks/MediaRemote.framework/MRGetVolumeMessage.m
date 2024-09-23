@implementation MRGetVolumeMessage

- (MRGetVolumeMessage)init
{
  return -[MRGetVolumeMessage initWithOutputDeviceUID:](self, "initWithOutputDeviceUID:", 0);
}

- (MRGetVolumeMessage)initWithOutputDeviceUID:(id)a3
{
  id v4;
  MRGetVolumeMessage *v5;
  _MRGetVolumeMessageProtobuf *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRGetVolumeMessage;
  v5 = -[MRProtocolMessage init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRGetVolumeMessageProtobuf);
    -[_MRGetVolumeMessageProtobuf setOutputDeviceUID:](v6, "setOutputDeviceUID:", v4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

  }
  return v5;
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
  return 49;
}

@end
