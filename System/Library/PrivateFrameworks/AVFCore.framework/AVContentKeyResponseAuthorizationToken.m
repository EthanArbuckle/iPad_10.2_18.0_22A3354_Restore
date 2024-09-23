@implementation AVContentKeyResponseAuthorizationToken

- (AVContentKeyResponseAuthorizationToken)initWithAuthorizationTokenData:(id)a3
{
  AVContentKeyResponseAuthorizationToken *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVContentKeyResponseAuthorizationToken;
  v4 = -[AVContentKeyResponse initWithKeySystem:](&v6, sel_initWithKeySystem_, CFSTR("AuthorizationTokenSystem"));
  if (v4)
    v4->_authorizationTokenData = (NSData *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVContentKeyResponseAuthorizationToken;
  -[AVContentKeyResponse dealloc](&v3, sel_dealloc);
}

@end
