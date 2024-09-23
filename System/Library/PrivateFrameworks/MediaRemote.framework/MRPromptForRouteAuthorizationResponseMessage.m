@implementation MRPromptForRouteAuthorizationResponseMessage

- (MRPromptForRouteAuthorizationResponseMessage)initWithResponse:(id)a3
{
  id v4;
  MRPromptForRouteAuthorizationResponseMessage *v5;
  _MRPromptForRouteAuthorizationResponseMessageProtobuf *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRPromptForRouteAuthorizationResponseMessage;
  v5 = -[MRProtocolMessage init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRPromptForRouteAuthorizationResponseMessageProtobuf);
    -[_MRPromptForRouteAuthorizationResponseMessageProtobuf setResponse:](v6, "setResponse:", v4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

  }
  return v5;
}

- (NSString)response
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 60;
}

@end
