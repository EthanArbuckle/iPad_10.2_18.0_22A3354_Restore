@implementation MRPlaybackSessionMigrateRequestMessage

- (MRPlaybackSessionMigrateRequestMessage)initWithPlaybackSession:(id)a3 request:(id)a4 forPlayerPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRPlaybackSessionMigrateRequestMessage *v11;
  _MRPlaybackSessionMigrateRequestMessageProtobuf *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MRPlaybackSessionMigrateRequestMessage;
  v11 = -[MRProtocolMessage init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(_MRPlaybackSessionMigrateRequestMessageProtobuf);
    objc_msgSend(v8, "protobuf");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf setPlaybackSession:](v12, "setPlaybackSession:", v13);

    objc_msgSend(v9, "protobuf");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf setRequest:](v12, "setRequest:", v14);

    objc_msgSend(v10, "protobuf");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf setPlayerPath:](v12, "setPlayerPath:", v15);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v11, "setUnderlyingCodableMessage:", v12);
  }

  return v11;
}

- (MRPlaybackSession)playbackSession
{
  MRPlaybackSession *v3;
  void *v4;
  void *v5;
  MRPlaybackSession *v6;

  v3 = [MRPlaybackSession alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRPlaybackSession initWithProtobuf:](v3, "initWithProtobuf:", v5);

  return v6;
}

- (MRPlaybackSessionMigrateRequest)request
{
  MRPlaybackSessionMigrateRequest *v3;
  void *v4;
  void *v5;
  MRPlaybackSessionMigrateRequest *v6;

  v3 = [MRPlaybackSessionMigrateRequest alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRPlaybackSessionMigrateRequest initWithProtobuf:](v3, "initWithProtobuf:", v5);

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
  return 73;
}

@end
