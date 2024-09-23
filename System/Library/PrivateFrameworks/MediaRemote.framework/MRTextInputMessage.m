@implementation MRTextInputMessage

- (MRTextInputMessage)initWithActionType:(unint64_t)a3 text:(id)a4
{
  id v6;
  MRTextInputMessage *v7;
  _MRTextInputMessageProtobuf *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MRTextInputMessage;
  v7 = -[MRProtocolMessage init](&v10, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(_MRTextInputMessageProtobuf);
    -[_MRTextInputMessageProtobuf setText:](v8, "setText:", v6);
    -[_MRTextInputMessageProtobuf setActionType:](v8, "setActionType:", a3);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v8);

  }
  return v7;
}

- (unint64_t)actionType
{
  void *v2;
  unint64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "actionType");

  return v3;
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 25;
}

@end
