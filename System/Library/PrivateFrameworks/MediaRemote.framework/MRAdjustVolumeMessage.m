@implementation MRAdjustVolumeMessage

- (MRAdjustVolumeMessage)initWithAdjustment:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  id v8;
  id v9;
  MRAdjustVolumeMessage *v10;
  _MRAdjustVolumeMessageProtobuf *v11;
  void *v12;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRAdjustVolumeMessage;
  v10 = -[MRProtocolMessage init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(_MRAdjustVolumeMessageProtobuf);
    -[_MRAdjustVolumeMessageProtobuf setAdjustment:](v11, "setAdjustment:", a3);
    -[_MRAdjustVolumeMessageProtobuf setOutputDeviceUID:](v11, "setOutputDeviceUID:", v8);
    objc_msgSend(v9, "protobuf");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRAdjustVolumeMessageProtobuf setDetails:](v11, "setDetails:", v12);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v10, "setUnderlyingCodableMessage:", v11);
  }

  return v10;
}

- (int64_t)adjustment
{
  void *v2;
  int64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "adjustment");

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
  return 125;
}

@end
