@implementation MRGetVolumeControlCapabilitiesMessage

- (MRGetVolumeControlCapabilitiesMessage)initWithOutputDeviceUID:(id)a3
{
  id v4;
  MRGetVolumeControlCapabilitiesMessage *v5;
  _MRGetVolumeControlCapabilitiesMessageProtobuf *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRGetVolumeControlCapabilitiesMessage;
  v5 = -[MRProtocolMessage init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRGetVolumeControlCapabilitiesMessageProtobuf);
    -[_MRGetVolumeControlCapabilitiesMessageProtobuf setOutputDeviceUID:](v6, "setOutputDeviceUID:", v4);
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
  return 62;
}

@end
