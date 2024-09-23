@implementation MRUpdatePlayerMessage

- (MRUpdatePlayerMessage)initWithPlayerPath:(id)a3
{
  id v4;
  MRUpdatePlayerMessage *v5;
  _MRUpdatePlayerMessageProtobuf *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRUpdatePlayerMessage;
  v5 = -[MRProtocolMessage init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRUpdatePlayerMessageProtobuf);
    objc_msgSend(v4, "skeleton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlayer:", v8);

    objc_msgSend(v7, "protobuf");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRUpdatePlayerMessageProtobuf setPlayerPath:](v6, "setPlayerPath:", v9);

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
  return 58;
}

@end
