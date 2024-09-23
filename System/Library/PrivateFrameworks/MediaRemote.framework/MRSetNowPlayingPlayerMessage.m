@implementation MRSetNowPlayingPlayerMessage

- (MRSetNowPlayingPlayerMessage)initWithPlayerPath:(id)a3
{
  id v4;
  MRSetNowPlayingPlayerMessage *v5;
  _MRSetNowPlayingPlayerMessageProtobuf *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRSetNowPlayingPlayerMessage;
  v5 = -[MRProtocolMessage init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRSetNowPlayingPlayerMessageProtobuf);
    objc_msgSend(v4, "skeleton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protobuf");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRSetNowPlayingPlayerMessageProtobuf setPlayerPath:](v6, "setPlayerPath:", v8);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);
  }

  return v5;
}

- (MRPlayerPath)playerPath
{
  MRPlayerPath *v3;
  void *v4;
  void *v5;
  MRPlayerPath *v6;

  v3 = [MRPlayerPath alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRPlayerPath initWithProtobuf:](v3, "initWithProtobuf:", v5);

  return v6;
}

- (unint64_t)type
{
  return 47;
}

@end
