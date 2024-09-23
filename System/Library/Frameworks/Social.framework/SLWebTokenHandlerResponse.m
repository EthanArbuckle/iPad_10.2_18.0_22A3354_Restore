@implementation SLWebTokenHandlerResponse

- (SLWebTokenHandlerResponse)initWithTokenResponse:(id)a3 usernames:(id)a4 displayname:(id)a5
{
  id v8;
  id v9;
  id v10;
  SLWebTokenHandlerResponse *v11;
  uint64_t v12;
  NSString *token;
  uint64_t v14;
  NSString *refreshToken;
  uint64_t v16;
  NSString *idToken;
  uint64_t v18;
  NSDate *expiryDate;
  uint64_t v20;
  NSArray *grantedDataclasses;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SLWebTokenHandlerResponse;
  v11 = -[SLWebTokenHandlerResponse init](&v23, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "token");
    v12 = objc_claimAutoreleasedReturnValue();
    token = v11->_token;
    v11->_token = (NSString *)v12;

    objc_msgSend(v8, "refreshToken");
    v14 = objc_claimAutoreleasedReturnValue();
    refreshToken = v11->_refreshToken;
    v11->_refreshToken = (NSString *)v14;

    objc_msgSend(v8, "idToken");
    v16 = objc_claimAutoreleasedReturnValue();
    idToken = v11->_idToken;
    v11->_idToken = (NSString *)v16;

    objc_msgSend(v8, "expiryDate");
    v18 = objc_claimAutoreleasedReturnValue();
    expiryDate = v11->_expiryDate;
    v11->_expiryDate = (NSDate *)v18;

    objc_msgSend(v8, "grantedDataclasses");
    v20 = objc_claimAutoreleasedReturnValue();
    grantedDataclasses = v11->_grantedDataclasses;
    v11->_grantedDataclasses = (NSArray *)v20;

    objc_storeStrong((id *)&v11->_displayName, a5);
    objc_storeStrong((id *)&v11->_usernames, a4);
  }

  return v11;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSString)idToken
{
  return self->_idToken;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSArray)grantedDataclasses
{
  return self->_grantedDataclasses;
}

- (NSArray)usernames
{
  return self->_usernames;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_usernames, 0);
  objc_storeStrong((id *)&self->_grantedDataclasses, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_idToken, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
