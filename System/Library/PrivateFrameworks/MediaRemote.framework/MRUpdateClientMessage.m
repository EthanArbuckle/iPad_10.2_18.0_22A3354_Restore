@implementation MRUpdateClientMessage

- (MRUpdateClientMessage)initWithClient:(id)a3
{
  id v4;
  MRUpdateClientMessage *v5;
  _MRUpdateClientMessageProtobuf *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUpdateClientMessage;
  v5 = -[MRProtocolMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRUpdateClientMessageProtobuf);
    objc_msgSend(v4, "protobuf");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRUpdateClientMessageProtobuf setClient:](v6, "setClient:", v7);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);
  }

  return v5;
}

- (MRClient)client
{
  MRClient *v3;
  void *v4;
  void *v5;
  MRClient *v6;

  v3 = [MRClient alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRClient initWithProtobuf:](v3, "initWithProtobuf:", v5);

  return v6;
}

- (unint64_t)type
{
  return 55;
}

@end
