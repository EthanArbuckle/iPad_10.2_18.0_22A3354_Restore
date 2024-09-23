@implementation MRRemoteTextInputMessage

- (MRRemoteTextInputMessage)initWithVersion:(unint64_t)a3 data:(id)a4
{
  id v6;
  MRRemoteTextInputMessage *v7;
  _MRRemoteTextInputMessageProtobuf *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MRRemoteTextInputMessage;
  v7 = -[MRProtocolMessage init](&v10, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(_MRRemoteTextInputMessageProtobuf);
    -[_MRRemoteTextInputMessageProtobuf setVersion:](v8, "setVersion:", a3);
    -[_MRRemoteTextInputMessageProtobuf setData:](v8, "setData:", v6);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v8);

  }
  return v7;
}

- (unint64_t)version
{
  void *v2;
  unint64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "version");

  return v3;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (unint64_t)type
{
  return 67;
}

@end
