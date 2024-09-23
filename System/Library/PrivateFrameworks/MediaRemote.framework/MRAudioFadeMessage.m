@implementation MRAudioFadeMessage

- (MRAudioFadeMessage)initWithPlayerPath:(id)a3 fadeType:(int64_t)a4
{
  id v6;
  MRAudioFadeMessage *v7;
  _MRAudioFadeMessageProtobuf *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRAudioFadeMessage;
  v7 = -[MRProtocolMessage init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(_MRAudioFadeMessageProtobuf);
    objc_msgSend(v6, "protobuf");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRAudioFadeMessageProtobuf setPlayerPath:](v8, "setPlayerPath:", v9);

    -[_MRAudioFadeMessageProtobuf setFadeType:](v8, "setFadeType:", a4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v8);

  }
  return v7;
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

- (int64_t)fadeType
{
  void *v2;
  int64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "fadeType");

  return v3;
}

- (unint64_t)type
{
  return 106;
}

@end
