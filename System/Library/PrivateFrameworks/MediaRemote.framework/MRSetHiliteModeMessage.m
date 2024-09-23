@implementation MRSetHiliteModeMessage

- (MRSetHiliteModeMessage)initWithHiliteMode:(BOOL)a3
{
  _BOOL8 v3;
  MRSetHiliteModeMessage *v4;
  _MRSetHiliteModeMessageProtobuf *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRSetHiliteModeMessage;
  v4 = -[MRProtocolMessage init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(_MRSetHiliteModeMessageProtobuf);
    -[_MRSetHiliteModeMessageProtobuf setHiliteMode:](v5, "setHiliteMode:", v3);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v4, "setUnderlyingCodableMessage:", v5);

  }
  return v4;
}

- (BOOL)hiliteMode
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hiliteMode");

  return v3;
}

- (unint64_t)type
{
  return 40;
}

@end
