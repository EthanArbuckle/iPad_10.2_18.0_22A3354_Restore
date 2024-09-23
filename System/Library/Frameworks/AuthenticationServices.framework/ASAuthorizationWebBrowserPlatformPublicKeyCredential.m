@implementation ASAuthorizationWebBrowserPlatformPublicKeyCredential

- (ASAuthorizationWebBrowserPlatformPublicKeyCredential)initWithCorePasskey:(id)a3
{
  id v5;
  ASAuthorizationWebBrowserPlatformPublicKeyCredential *v6;
  ASAuthorizationWebBrowserPlatformPublicKeyCredential *v7;
  ASAuthorizationWebBrowserPlatformPublicKeyCredential *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationWebBrowserPlatformPublicKeyCredential;
  v6 = -[ASAuthorizationWebBrowserPlatformPublicKeyCredential init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_corePasskey, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)name
{
  return (NSString *)-[WBSWebBrowserPasskey name](self->_corePasskey, "name");
}

- (NSString)relyingParty
{
  return (NSString *)-[WBSWebBrowserPasskey relyingParty](self->_corePasskey, "relyingParty");
}

- (NSData)credentialID
{
  return (NSData *)-[WBSWebBrowserPasskey credentialID](self->_corePasskey, "credentialID");
}

- (NSData)userHandle
{
  return (NSData *)-[WBSWebBrowserPasskey userHandle](self->_corePasskey, "userHandle");
}

- (NSString)customTitle
{
  return (NSString *)-[WBSWebBrowserPasskey customTitle](self->_corePasskey, "customTitle");
}

- (NSString)providerName
{
  return (NSString *)-[WBSWebBrowserPasskey providerName](self->_corePasskey, "providerName");
}

- (WBSWebBrowserPasskey)corePasskey
{
  return self->_corePasskey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_corePasskey, 0);
}

@end
