@implementation MRPlaybackSessionResponseMessage

- (MRPlaybackSessionResponseMessage)initWithPlaybackSession:(id)a3
{
  id v4;
  MRPlaybackSessionResponseMessage *v5;
  _MRPlaybackSessionResponseMessageProtobuf *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRPlaybackSessionResponseMessage;
  v5 = -[MRProtocolMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRPlaybackSessionResponseMessageProtobuf);
    objc_msgSend(v4, "protobuf");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionResponseMessageProtobuf setPlaybackSession:](v6, "setPlaybackSession:", v7);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);
  }

  return v5;
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

- (unint64_t)type
{
  return 71;
}

@end
