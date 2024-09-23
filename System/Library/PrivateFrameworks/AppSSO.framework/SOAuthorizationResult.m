@implementation SOAuthorizationResult

- (SOAuthorizationResult)init
{
  SOAuthorizationResult *v2;
  SOAuthorizationResultCore *v3;
  SOAuthorizationResultCore *authorizationResultCore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SOAuthorizationResult;
  v2 = -[SOAuthorizationResult init](&v6, sel_init);
  if (v2)
  {
    v3 = (SOAuthorizationResultCore *)objc_alloc_init((Class)getSOAuthorizationResultCoreClass());
    authorizationResultCore = v2->_authorizationResultCore;
    v2->_authorizationResultCore = v3;

  }
  return v2;
}

- (SOAuthorizationResult)initWithHTTPAuthorizationHeaders:(id)a3
{
  id v4;
  SOAuthorizationResult *v5;
  uint64_t v6;
  SOAuthorizationResultCore *authorizationResultCore;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOAuthorizationResult;
  v5 = -[SOAuthorizationResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)getSOAuthorizationResultCoreClass()), "initWithHTTPAuthorizationHeaders:", v4);
    authorizationResultCore = v5->_authorizationResultCore;
    v5->_authorizationResultCore = (SOAuthorizationResultCore *)v6;

  }
  return v5;
}

- (SOAuthorizationResult)initWithHTTPResponse:(id)a3 httpBody:(id)a4
{
  id v6;
  id v7;
  SOAuthorizationResult *v8;
  uint64_t v9;
  SOAuthorizationResultCore *authorizationResultCore;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SOAuthorizationResult;
  v8 = -[SOAuthorizationResult init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)getSOAuthorizationResultCoreClass()), "initWithHTTPResponse:httpBody:", v6, v7);
    authorizationResultCore = v8->_authorizationResultCore;
    v8->_authorizationResultCore = (SOAuthorizationResultCore *)v9;

  }
  return v8;
}

- (NSDictionary)httpAuthorizationHeaders
{
  return (NSDictionary *)-[SOAuthorizationResultCore httpAuthorizationHeaders](self->_authorizationResultCore, "httpAuthorizationHeaders");
}

- (void)setHttpAuthorizationHeaders:(id)a3
{
  -[SOAuthorizationResultCore setHttpAuthorizationHeaders:](self->_authorizationResultCore, "setHttpAuthorizationHeaders:", a3);
}

- (NSHTTPURLResponse)httpResponse
{
  return (NSHTTPURLResponse *)-[SOAuthorizationResultCore httpResponse](self->_authorizationResultCore, "httpResponse");
}

- (void)setHttpResponse:(id)a3
{
  -[SOAuthorizationResultCore setHttpResponse:](self->_authorizationResultCore, "setHttpResponse:", a3);
}

- (NSData)httpBody
{
  return (NSData *)-[SOAuthorizationResultCore httpBody](self->_authorizationResultCore, "httpBody");
}

- (void)setHttpBody:(id)a3
{
  -[SOAuthorizationResultCore setHttpBody:](self->_authorizationResultCore, "setHttpBody:", a3);
}

- (NSArray)privateKeys
{
  return (NSArray *)-[SOAuthorizationResultCore privateKeys](self->_authorizationResultCore, "privateKeys");
}

- (void)setPrivateKeys:(id)a3
{
  -[SOAuthorizationResultCore setPrivateKeys:](self->_authorizationResultCore, "setPrivateKeys:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationResultCore, 0);
}

@end
