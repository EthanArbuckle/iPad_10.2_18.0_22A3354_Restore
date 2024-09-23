@implementation ASAuthorizationProviderExtensionAuthorizationResult

- (ASAuthorizationProviderExtensionAuthorizationResult)init
{
  ASAuthorizationProviderExtensionAuthorizationResult *v2;
  SOAuthorizationResult *v3;
  SOAuthorizationResult *authorizationResult;
  void *v5;
  ASAuthorizationProviderExtensionAuthorizationResult *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASAuthorizationProviderExtensionAuthorizationResult;
  v2 = -[ASAuthorizationProviderExtensionAuthorizationResult init](&v8, sel_init);
  if (v2)
  {
    v3 = (SOAuthorizationResult *)objc_alloc_init(MEMORY[0x24BE04360]);
    authorizationResult = v2->_authorizationResult;
    v2->_authorizationResult = v3;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationProviderExtensionAuthorizationResult setPrivateKeys:](v2, "setPrivateKeys:", v5);

    v6 = v2;
  }

  return v2;
}

- (ASAuthorizationProviderExtensionAuthorizationResult)initWithHTTPAuthorizationHeaders:(NSDictionary *)httpAuthorizationHeaders
{
  NSDictionary *v4;
  ASAuthorizationProviderExtensionAuthorizationResult *v5;
  uint64_t v6;
  SOAuthorizationResult *authorizationResult;
  void *v8;
  ASAuthorizationProviderExtensionAuthorizationResult *v9;
  objc_super v11;

  v4 = httpAuthorizationHeaders;
  v11.receiver = self;
  v11.super_class = (Class)ASAuthorizationProviderExtensionAuthorizationResult;
  v5 = -[ASAuthorizationProviderExtensionAuthorizationResult init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE04360]), "initWithHTTPAuthorizationHeaders:", v4);
    authorizationResult = v5->_authorizationResult;
    v5->_authorizationResult = (SOAuthorizationResult *)v6;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationProviderExtensionAuthorizationResult setPrivateKeys:](v5, "setPrivateKeys:", v8);

    v9 = v5;
  }

  return v5;
}

- (ASAuthorizationProviderExtensionAuthorizationResult)initWithHTTPResponse:(NSHTTPURLResponse *)httpResponse httpBody:(NSData *)httpBody
{
  NSHTTPURLResponse *v6;
  NSData *v7;
  ASAuthorizationProviderExtensionAuthorizationResult *v8;
  uint64_t v9;
  SOAuthorizationResult *authorizationResult;
  void *v11;
  ASAuthorizationProviderExtensionAuthorizationResult *v12;
  objc_super v14;

  v6 = httpResponse;
  v7 = httpBody;
  v14.receiver = self;
  v14.super_class = (Class)ASAuthorizationProviderExtensionAuthorizationResult;
  v8 = -[ASAuthorizationProviderExtensionAuthorizationResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE04360]), "initWithHTTPResponse:httpBody:", v6, v7);
    authorizationResult = v8->_authorizationResult;
    v8->_authorizationResult = (SOAuthorizationResult *)v9;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationProviderExtensionAuthorizationResult setPrivateKeys:](v8, "setPrivateKeys:", v11);

    v12 = v8;
  }

  return v8;
}

- (NSDictionary)httpAuthorizationHeaders
{
  return (NSDictionary *)-[SOAuthorizationResult httpAuthorizationHeaders](self->_authorizationResult, "httpAuthorizationHeaders");
}

- (void)setHttpAuthorizationHeaders:(NSDictionary *)httpAuthorizationHeaders
{
  -[SOAuthorizationResult setHttpAuthorizationHeaders:](self->_authorizationResult, "setHttpAuthorizationHeaders:", httpAuthorizationHeaders);
}

- (NSHTTPURLResponse)httpResponse
{
  return (NSHTTPURLResponse *)-[SOAuthorizationResult httpResponse](self->_authorizationResult, "httpResponse");
}

- (void)setHttpResponse:(NSHTTPURLResponse *)httpResponse
{
  -[SOAuthorizationResult setHttpResponse:](self->_authorizationResult, "setHttpResponse:", httpResponse);
}

- (NSData)httpBody
{
  return (NSData *)-[SOAuthorizationResult httpBody](self->_authorizationResult, "httpBody");
}

- (void)setHttpBody:(NSData *)httpBody
{
  -[SOAuthorizationResult setHttpBody:](self->_authorizationResult, "setHttpBody:", httpBody);
}

- (NSArray)privateKeys
{
  return (NSArray *)-[SOAuthorizationResult privateKeys](self->_authorizationResult, "privateKeys");
}

- (void)setPrivateKeys:(NSArray *)privateKeys
{
  -[SOAuthorizationResult setPrivateKeys:](self->_authorizationResult, "setPrivateKeys:", privateKeys);
}

- (SOAuthorizationResult)authorizationResult
{
  return self->_authorizationResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationResult, 0);
}

@end
