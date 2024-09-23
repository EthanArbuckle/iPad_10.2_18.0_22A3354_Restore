@implementation DAEASOAuthIdentity

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)oauthURI
{
  return self->_oauthURI;
}

- (void)setOauthURI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)tokenRequestURI
{
  return self->_tokenRequestURI;
}

- (void)setTokenRequestURI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)jwksData
{
  return self->_jwksData;
}

- (void)setJwksData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)jwksURI
{
  return self->_jwksURI;
}

- (void)setJwksURI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_jwksURI, 0);
  objc_storeStrong((id *)&self->_jwksData, 0);
  objc_storeStrong((id *)&self->_tokenRequestURI, 0);
  objc_storeStrong((id *)&self->_oauthURI, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
