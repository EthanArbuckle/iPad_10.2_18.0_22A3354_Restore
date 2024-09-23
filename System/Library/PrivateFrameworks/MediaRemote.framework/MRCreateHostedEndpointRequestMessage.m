@implementation MRCreateHostedEndpointRequestMessage

- (MRCreateHostedEndpointRequestMessage)initWithOutputDeviceUIDs:(id)a3
{
  id v4;
  MRCreateHostedEndpointRequestMessage *v5;
  _MRCreateHostedEndpointRequestProtobuf *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRCreateHostedEndpointRequestMessage;
  v5 = -[MRProtocolMessage init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRCreateHostedEndpointRequestProtobuf);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    -[MRProtocolMessage underlyingCodableMessage](v5, "underlyingCodableMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOutputDeviceUIDs:", v7);

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
  return 121;
}

@end
