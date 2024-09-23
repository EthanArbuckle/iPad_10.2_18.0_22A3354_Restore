@implementation MRSetNowPlayingClientMessage

- (MRSetNowPlayingClientMessage)initWithClient:(id)a3
{
  id v4;
  MRSetNowPlayingClientMessage *v5;
  _MRSetNowPlayingClientMessageProtobuf *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRSetNowPlayingClientMessage;
  v5 = -[MRProtocolMessage init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRSetNowPlayingClientMessageProtobuf);
    objc_msgSend(v4, "skeleton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protobuf");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRSetNowPlayingClientMessageProtobuf setClient:](v6, "setClient:", v8);

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
  return 46;
}

@end
