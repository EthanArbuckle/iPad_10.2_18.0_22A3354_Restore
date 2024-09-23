@implementation ASCAppleIDCredential

- (ASCAppleIDCredential)initWithUser:(id)a3 identityToken:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASCAppleIDCredential *v11;
  uint64_t v12;
  NSString *user;
  uint64_t v14;
  NSData *identityToken;
  uint64_t v16;
  NSString *state;
  ASCAppleIDCredential *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ASCAppleIDCredential;
  v11 = -[ASCAppleIDCredential init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    user = v11->_user;
    v11->_user = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    identityToken = v11->_identityToken;
    v11->_identityToken = (NSData *)v14;

    v16 = objc_msgSend(v10, "copy");
    state = v11->_state;
    v11->_state = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (ASCAppleIDCredential)initWithAuthorization:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ASCAppleIDCredential *v10;
  ASCAppleIDCredential *v11;

  v5 = a3;
  objc_msgSend(v5, "credential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ASCAppleIDCredential initWithUser:identityToken:state:](self, "initWithUser:identityToken:state:", v7, v8, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_authorization, a3);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AKAuthorization *authorization;
  ASCAppleIDCredential *v5;

  authorization = self->_authorization;
  v5 = [ASCAppleIDCredential alloc];
  if (authorization)
    return -[ASCAppleIDCredential initWithAuthorization:](v5, "initWithAuthorization:", self->_authorization);
  else
    return -[ASCAppleIDCredential initWithUser:identityToken:state:](v5, "initWithUser:identityToken:state:", self->_user, self->_identityToken, self->_state);
}

- (void)encodeWithCoder:(id)a3
{
  AKAuthorization *authorization;
  id v5;

  authorization = self->_authorization;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", authorization, CFSTR("Authorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_user, CFSTR("User"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identityToken, CFSTR("IdentityToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("State"));

}

- (ASCAppleIDCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ASCAppleIDCredential *v9;
  ASCAppleIDCredential *v10;
  ASCAppleIDCredential *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Authorization"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("User"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentityToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("State"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ASCAppleIDCredential initWithUser:identityToken:state:](self, "initWithUser:identityToken:state:", v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorization, v5);
    v11 = v10;
  }

  return v10;
}

- (AKAuthorization)authorization
{
  return self->_authorization;
}

- (NSString)user
{
  return self->_user;
}

- (NSData)identityToken
{
  return self->_identityToken;
}

- (NSString)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
}

@end
