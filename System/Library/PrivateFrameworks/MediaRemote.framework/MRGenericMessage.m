@implementation MRGenericMessage

- (MRGenericMessage)initWithKey:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  MRGenericMessage *v8;
  _MRGenericMessageProtobuf *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRGenericMessage;
  v8 = -[MRProtocolMessage init](&v11, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(_MRGenericMessageProtobuf);
    -[_MRGenericMessageProtobuf setKey:](v9, "setKey:", v6);
    -[_MRGenericMessageProtobuf setData:](v9, "setData:", v7);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v8, "setUnderlyingCodableMessage:", v9);

  }
  return v8;
}

- (NSString)key
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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
  return 42;
}

@end
