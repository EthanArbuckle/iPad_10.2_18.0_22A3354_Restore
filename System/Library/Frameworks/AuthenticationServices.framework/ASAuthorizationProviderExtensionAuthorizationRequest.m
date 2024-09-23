@implementation ASAuthorizationProviderExtensionAuthorizationRequest

- (ASAuthorizationProviderExtensionAuthorizationRequest)initWithAuthorizationRequest:(id)a3
{
  id v5;
  ASAuthorizationProviderExtensionAuthorizationRequest *v6;
  ASAuthorizationProviderExtensionAuthorizationRequest *v7;
  ASAuthorizationProviderExtensionAuthorizationRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationProviderExtensionAuthorizationRequest;
  v6 = -[ASAuthorizationProviderExtensionAuthorizationRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authorizationRequest, a3);
    v8 = v7;
  }

  return v7;
}

- (void)doNotHandle
{
  -[SOAuthorizationRequest doNotHandle](self->_authorizationRequest, "doNotHandle");
}

- (void)cancel
{
  -[SOAuthorizationRequest cancel](self->_authorizationRequest, "cancel");
}

- (void)complete
{
  -[SOAuthorizationRequest complete](self->_authorizationRequest, "complete");
}

- (void)completeWithHTTPAuthorizationHeaders:(NSDictionary *)httpAuthorizationHeaders
{
  -[SOAuthorizationRequest completeWithHTTPAuthorizationHeaders:](self->_authorizationRequest, "completeWithHTTPAuthorizationHeaders:", httpAuthorizationHeaders);
}

- (void)completeWithHTTPResponse:(NSHTTPURLResponse *)httpResponse httpBody:(NSData *)httpBody
{
  -[SOAuthorizationRequest completeWithHTTPResponse:httpBody:](self->_authorizationRequest, "completeWithHTTPResponse:httpBody:", httpResponse, httpBody);
}

- (void)completeWithError:(NSError *)error
{
  -[SOAuthorizationRequest completeWithError:](self->_authorizationRequest, "completeWithError:", error);
}

- (void)completeWithAuthorizationResult:(ASAuthorizationProviderExtensionAuthorizationResult *)authorizationResult
{
  SOAuthorizationRequest *authorizationRequest;
  id v4;

  authorizationRequest = self->_authorizationRequest;
  -[ASAuthorizationProviderExtensionAuthorizationResult authorizationResult](authorizationResult, "authorizationResult");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SOAuthorizationRequest completeWithAuthorizationResult:](authorizationRequest, "completeWithAuthorizationResult:", v4);

}

- (void)presentAuthorizationViewControllerWithCompletion:(void *)completion
{
  -[SOAuthorizationRequest presentAuthorizationViewControllerWithCompletion:](self->_authorizationRequest, "presentAuthorizationViewControllerWithCompletion:", completion);
}

- (NSURL)url
{
  return (NSURL *)-[SOAuthorizationRequest url](self->_authorizationRequest, "url");
}

- (ASAuthorizationProviderAuthorizationOperation)requestedOperation
{
  return (ASAuthorizationProviderAuthorizationOperation)-[SOAuthorizationRequest requestedOperation](self->_authorizationRequest, "requestedOperation");
}

- (NSDictionary)httpHeaders
{
  return (NSDictionary *)-[SOAuthorizationRequest httpHeaders](self->_authorizationRequest, "httpHeaders");
}

- (NSData)httpBody
{
  return (NSData *)-[SOAuthorizationRequest httpBody](self->_authorizationRequest, "httpBody");
}

- (NSString)realm
{
  return (NSString *)-[SOAuthorizationRequest realm](self->_authorizationRequest, "realm");
}

- (NSDictionary)extensionData
{
  return (NSDictionary *)-[SOAuthorizationRequest extensionData](self->_authorizationRequest, "extensionData");
}

- (NSString)callerBundleIdentifier
{
  return (NSString *)-[SOAuthorizationRequest callerBundleIdentifier](self->_authorizationRequest, "callerBundleIdentifier");
}

- (NSDictionary)authorizationOptions
{
  return (NSDictionary *)-[SOAuthorizationRequest authorizationOptions](self->_authorizationRequest, "authorizationOptions");
}

- (BOOL)isCallerManaged
{
  return -[SOAuthorizationRequest isCallerManaged](self->_authorizationRequest, "isCallerManaged");
}

- (NSString)callerTeamIdentifier
{
  return (NSString *)-[SOAuthorizationRequest callerTeamIdentifier](self->_authorizationRequest, "callerTeamIdentifier");
}

- (NSString)localizedCallerDisplayName
{
  return (NSString *)-[SOAuthorizationRequest localizedCallerDisplayName](self->_authorizationRequest, "localizedCallerDisplayName");
}

- (BOOL)isUserInterfaceEnabled
{
  return -[SOAuthorizationRequest isUserInteractionEnabled](self->_authorizationRequest, "isUserInteractionEnabled");
}

- (SOAuthorizationRequest)authorizationRequest
{
  return self->_authorizationRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationRequest, 0);
}

@end
