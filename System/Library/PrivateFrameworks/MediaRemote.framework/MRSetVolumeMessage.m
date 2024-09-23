@implementation MRSetVolumeMessage

- (MRSetVolumeMessage)initWithVolume:(float)a3
{
  return -[MRSetVolumeMessage initWithVolume:outputDeviceUID:details:](self, "initWithVolume:outputDeviceUID:details:", 0, 0);
}

- (MRSetVolumeMessage)initWithVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  id v8;
  id v9;
  MRSetVolumeMessage *v10;
  _MRSetVolumeMessageProtobuf *v11;
  double v12;
  void *v13;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MRSetVolumeMessage;
  v10 = -[MRProtocolMessage init](&v15, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(_MRSetVolumeMessageProtobuf);
    -[_MRSetVolumeMessageProtobuf setOutputDeviceUID:](v11, "setOutputDeviceUID:", v8);
    *(float *)&v12 = a3;
    -[_MRSetVolumeMessageProtobuf setVolume:](v11, "setVolume:", v12);
    objc_msgSend(v9, "protobuf");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRSetVolumeMessageProtobuf setDetails:](v11, "setDetails:", v13);

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
  return 51;
}

@end
