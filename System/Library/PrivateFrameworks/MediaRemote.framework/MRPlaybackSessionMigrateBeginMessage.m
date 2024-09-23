@implementation MRPlaybackSessionMigrateBeginMessage

- (MRPlaybackSessionMigrateBeginMessage)initWithRequest:(id)a3 playerPath:(id)a4
{
  id v6;
  id v7;
  MRPlaybackSessionMigrateBeginMessage *v8;
  _MRPlaybackSessionMigrateBeginMessageProtobuf *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MRPlaybackSessionMigrateBeginMessage;
  v8 = -[MRProtocolMessage init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(_MRPlaybackSessionMigrateBeginMessageProtobuf);
    objc_msgSend(v6, "protobuf");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateBeginMessageProtobuf setRequest:](v9, "setRequest:", v10);

    objc_msgSend(v7, "protobuf");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateBeginMessageProtobuf setPlayerPath:](v9, "setPlayerPath:", v11);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v8, "setUnderlyingCodableMessage:", v9);
  }

  return v8;
}

- (MRPlaybackSessionRequest)request
{
  MRPlaybackSessionRequest *v3;
  void *v4;
  void *v5;
  MRPlaybackSessionRequest *v6;

  v3 = [MRPlaybackSessionRequest alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRPlaybackSessionRequest initWithProtobuf:](v3, "initWithProtobuf:", v5);

  return v6;
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
  return 75;
}

@end
