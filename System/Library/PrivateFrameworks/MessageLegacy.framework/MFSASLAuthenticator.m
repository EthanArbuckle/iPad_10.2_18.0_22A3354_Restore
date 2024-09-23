@implementation MFSASLAuthenticator

- (MFSASLAuthenticator)initWithAuthScheme:(id)a3 account:(id)a4 connection:(id)a5
{
  MFSASLAuthenticator *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFSASLAuthenticator;
  v8 = -[MFSASLAuthenticator init](&v10, sel_init);
  if (v8)
  {
    v8->_authScheme = (MFAuthScheme *)a3;
    v8->_account = (MFAccount *)a4;
    v8->_connection = (MFConnection *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFSASLAuthenticator;
  -[MFSASLAuthenticator dealloc](&v3, sel_dealloc);
}

- (id)authScheme
{
  return self->_authScheme;
}

- (id)account
{
  return self->_account;
}

- (id)saslName
{
  return -[MFAuthScheme name](self->_authScheme, "name");
}

- (BOOL)supportsInitialClientResponse
{
  return 0;
}

- (id)responseForServerData:(id)a3
{
  -[MFSASLAuthenticator setAuthenticationState:](self, "setAuthenticationState:", 2);
  return 0;
}

- (int)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(int)a3
{
  self->_authenticationState = a3;
}

- (BOOL)justSentPlainTextPassword
{
  return 0;
}

- (id)securityLayer
{
  return 0;
}

- (BOOL)isUsingSSL
{
  NSString *v2;

  v2 = -[MFConnection securityProtocol](self->_connection, "securityProtocol");
  if (v2)
    LOBYTE(v2) = -[NSString caseInsensitiveCompare:](v2, "caseInsensitiveCompare:", *MEMORY[0x1E0C9B328]) != NSOrderedSame;
  return (char)v2;
}

- (BOOL)base64EncodeResponseData
{
  return 1;
}

- (BOOL)couldRetry
{
  return 0;
}

- (void)setMissingPasswordError
{
  objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "missingPasswordErrorWithTitle:", 0));
}

@end
