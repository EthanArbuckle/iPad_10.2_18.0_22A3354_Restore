@implementation MRVolumeMutedDidChangeMessage

- (MRVolumeMutedDidChangeMessage)initWithMuted:(BOOL)a3 outputDeviceUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  MRVolumeMutedDidChangeMessage *v7;
  _MRVolumeMutedDidChangeMessageProtobuf *v8;
  objc_super v10;

  v4 = a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MRVolumeMutedDidChangeMessage;
  v7 = -[MRProtocolMessage init](&v10, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(_MRVolumeMutedDidChangeMessageProtobuf);
    -[_MRVolumeMutedDidChangeMessageProtobuf setIsMuted:](v8, "setIsMuted:", v4);
    -[_MRVolumeMutedDidChangeMessageProtobuf setOutputDeviceUID:](v8, "setOutputDeviceUID:", v6);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v8);

  }
  return v7;
}

- (BOOL)isMuted
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuted");

  return v3;
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
  return 129;
}

@end
