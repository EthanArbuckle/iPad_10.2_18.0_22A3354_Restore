@implementation MRPlaybackQueueRequestMessage

- (MRPlaybackQueueRequestMessage)initWithRequest:(id)a3 forPlayerPath:(id)a4
{
  id v6;
  id v7;
  MRPlaybackQueueRequestMessage *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MRPlaybackQueueRequestMessage;
  v8 = -[MRProtocolMessage init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "protobuf");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProtocolMessage setUnderlyingCodableMessage:](v8, "setUnderlyingCodableMessage:", v9);

    objc_msgSend(v7, "protobuf");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRProtocolMessage underlyingCodableMessage](v8, "underlyingCodableMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPlayerPath:", v10);

  }
  return v8;
}

- (MRPlaybackQueueRequest)request
{
  MRPlaybackQueueRequest *v3;
  void *v4;
  MRPlaybackQueueRequest *v5;

  v3 = [MRPlaybackQueueRequest alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRPlaybackQueueRequest initWithProtobuf:](v3, "initWithProtobuf:", v4);

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
  return 32;
}

@end
