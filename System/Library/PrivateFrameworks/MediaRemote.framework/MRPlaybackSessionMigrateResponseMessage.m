@implementation MRPlaybackSessionMigrateResponseMessage

- (MRPlaybackSessionMigrateResponseMessage)initWithRequest:(id)a3
{
  id v4;
  MRPlaybackSessionMigrateResponseMessage *v5;
  _MRPlaybackSessionMigrateResponseMessageProtobuf *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRPlaybackSessionMigrateResponseMessage;
  v5 = -[MRProtocolMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRPlaybackSessionMigrateResponseMessageProtobuf);
    objc_msgSend(v4, "protobuf");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateResponseMessageProtobuf setRequest:](v6, "setRequest:", v7);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);
  }

  return v5;
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

- (unint64_t)type
{
  return 74;
}

@end
