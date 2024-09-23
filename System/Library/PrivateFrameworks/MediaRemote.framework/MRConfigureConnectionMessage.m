@implementation MRConfigureConnectionMessage

- (MRConfigureConnectionMessage)initWithGroupID:(id)a3
{
  id v4;
  MRConfigureConnectionMessage *v5;
  _MRConfigureConnectionMessageProtobuf *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRConfigureConnectionMessage;
  v5 = -[MRProtocolMessage init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRConfigureConnectionMessageProtobuf);
    -[_MRConfigureConnectionMessageProtobuf setGroupID:](v6, "setGroupID:", v4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

  }
  return v5;
}

- (MRConfigureConnectionMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRConfigureConnectionMessage;
  return -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](&v5, sel_initWithUnderlyingCodableMessage_error_, a3, a4);
}

- (NSString)groupID
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setGroupID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupID:", v4);

}

- (unint64_t)type
{
  return 120;
}

@end
