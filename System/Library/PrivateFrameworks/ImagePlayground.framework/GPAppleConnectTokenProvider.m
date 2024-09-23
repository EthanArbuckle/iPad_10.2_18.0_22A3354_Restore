@implementation GPAppleConnectTokenProvider

- (GPAppleConnectTokenProvider)initWithAuthenticatingProtocol:(id)a3
{
  id v4;
  GPAppleConnectTokenProvider *v5;
  _TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift *v6;
  _TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GPAppleConnectTokenProvider;
  v5 = -[GPAppleConnectTokenProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = -[GPAppleConnectTokenProvider_Swift initWithAuthenticatingProtocol:]([_TtC15ImagePlayground33GPAppleConnectTokenProvider_Swift alloc], "initWithAuthenticatingProtocol:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

  }
  return v5;
}

- (void)setupTokenWithCompletion:(id)a3
{
  -[GPAppleConnectTokenProvider_Swift setupTokenWithCompletion:](self->_impl, "setupTokenWithCompletion:", a3);
}

- (NSString)token
{
  return self->_token;
}

- (GPAppleConnectAuthenticating)authenticatingProtocol
{
  return self->_authenticatingProtocol;
}

- (void)setAuthenticatingProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatingProtocol, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatingProtocol, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
