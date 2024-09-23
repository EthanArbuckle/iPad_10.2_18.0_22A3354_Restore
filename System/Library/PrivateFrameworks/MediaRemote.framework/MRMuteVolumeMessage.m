@implementation MRMuteVolumeMessage

- (MRMuteVolumeMessage)initWithMuted:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  MRMuteVolumeMessage *v10;
  _MRSetVolumeMutedMessageProtobuf *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRMuteVolumeMessage;
  v10 = -[MRProtocolMessage init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(_MRSetVolumeMutedMessageProtobuf);
    -[_MRSetVolumeMutedMessageProtobuf setIsMuted:](v11, "setIsMuted:", v6);
    -[_MRSetVolumeMutedMessageProtobuf setOutputDeviceUID:](v11, "setOutputDeviceUID:", v8);
    objc_msgSend(v9, "protobuf");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRSetVolumeMutedMessageProtobuf setDetails:](v11, "setDetails:", v12);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v10, "setUnderlyingCodableMessage:", v11);
  }

  return v10;
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

- (BOOL)isMuted
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMuted");

  return v3;
}

- (MRRequestDetails)details
{
  MRRequestDetails *v3;
  void *v4;
  void *v5;
  MRRequestDetails *v6;

  v3 = [MRRequestDetails alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRRequestDetails initWithProtobuf:](v3, "initWithProtobuf:", v5);

  return v6;
}

- (unint64_t)type
{
  return 128;
}

@end
