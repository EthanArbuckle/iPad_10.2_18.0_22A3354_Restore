@implementation MRAudioFadeResponseMessage

- (MRAudioFadeResponseMessage)initWithFadeDuration:(int64_t)a3 error:(id)a4
{
  id v6;
  MRAudioFadeResponseMessage *v7;
  _MRAudioFadeResponseMessageProtobuf *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MRAudioFadeResponseMessage;
  v7 = -[MRProtocolMessage init](&v10, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(_MRAudioFadeResponseMessageProtobuf);
    -[_MRAudioFadeResponseMessageProtobuf setFadeDuration:](v8, "setFadeDuration:", a3);
    -[MRProtocolMessage setError:](v7, "setError:", v6);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v8);

  }
  return v7;
}

- (int64_t)fadeDuration
{
  void *v2;
  int64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fadeDuration");

  return v3;
}

- (unint64_t)type
{
  return 107;
}

@end
