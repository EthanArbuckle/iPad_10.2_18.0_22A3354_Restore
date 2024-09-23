@implementation MRPlaybackSessionMigrateEndMessage

- (MRPlaybackSessionMigrateEndMessage)initWithRequest:(id)a3 error:(id)a4 playerPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRPlaybackSessionMigrateEndMessage *v11;
  _MRPlaybackSessionMigrateEndMessageProtobuf *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MRPlaybackSessionMigrateEndMessage;
  v11 = -[MRProtocolMessage init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(_MRPlaybackSessionMigrateEndMessageProtobuf);
    objc_msgSend(v8, "protobuf");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateEndMessageProtobuf setRequest:](v12, "setRequest:", v13);

    -[_MRPlaybackSessionMigrateEndMessageProtobuf setErrorCode:](v12, "setErrorCode:", objc_msgSend(v9, "code"));
    objc_msgSend(v9, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateEndMessageProtobuf setErrorDescription:](v12, "setErrorDescription:", v14);

    objc_msgSend(v10, "protobuf");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlaybackSessionMigrateEndMessageProtobuf setPlayerPath:](v12, "setPlayerPath:", v15);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v11, "setUnderlyingCodableMessage:", v12);
  }

  return v11;
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

- (NSError)error
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "errorCode") < 1)
  {
    v9 = 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "errorCode");
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithMRError:description:", v6, v8);

  }
  return (NSError *)v9;
}

- (unint64_t)type
{
  return 76;
}

@end
