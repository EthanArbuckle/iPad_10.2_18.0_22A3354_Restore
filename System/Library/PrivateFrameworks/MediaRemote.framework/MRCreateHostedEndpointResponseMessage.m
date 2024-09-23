@implementation MRCreateHostedEndpointResponseMessage

- (MRCreateHostedEndpointResponseMessage)initWithGroupUID:(id)a3
{
  id v4;
  MRCreateHostedEndpointResponseMessage *v5;
  _MRCreateHostedEndpointResponseProtobuf *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRCreateHostedEndpointResponseMessage;
  v5 = -[MRProtocolMessage init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRCreateHostedEndpointResponseProtobuf);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

    v7 = (void *)objc_msgSend(v4, "copy");
    -[MRProtocolMessage underlyingCodableMessage](v5, "underlyingCodableMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGroupUID:", v7);

  }
  return v5;
}

- (NSString)groupUID
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 122;
}

@end
