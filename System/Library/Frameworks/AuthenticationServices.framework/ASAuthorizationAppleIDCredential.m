@implementation ASAuthorizationAppleIDCredential

+ (ASAuthorizationAppleIDCredential)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ASAuthorizationAppleIDCredential)init
{
  -[ASAuthorizationAppleIDCredential doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ASAuthorizationAppleIDCredential)initWithUser:(id)a3 authorizedScopes:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ASAuthorizationAppleIDCredential *v10;
  uint64_t v11;
  NSString *user;
  uint64_t v13;
  NSArray *authorizedScopes;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAuthorizationAppleIDCredential.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASAuthorizationAppleIDCredential.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizedScopes"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)ASAuthorizationAppleIDCredential;
  v10 = -[ASAuthorizationAppleIDCredential init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    user = v10->_user;
    v10->_user = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    authorizedScopes = v10->_authorizedScopes;
    v10->_authorizedScopes = (NSArray *)v13;

    v10->_internalLock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { userIdentifier: %@, authorizedScopes: %@ }>"), v5, self, self->_user, self->_authorizedScopes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASAuthorizationAppleIDCredential *v4;

  v4 = -[ASAuthorizationAppleIDCredential initWithUser:authorizedScopes:]([ASAuthorizationAppleIDCredential alloc], "initWithUser:authorizedScopes:", self->_user, self->_authorizedScopes);
  -[ASAuthorizationAppleIDCredential setState:](v4, "setState:", self->_state);
  -[ASAuthorizationAppleIDCredential setAuthorizationCode:](v4, "setAuthorizationCode:", self->_authorizationCode);
  -[ASAuthorizationAppleIDCredential setIdentityToken:](v4, "setIdentityToken:", self->_identityToken);
  -[ASAuthorizationAppleIDCredential setEmail:](v4, "setEmail:", self->_email);
  -[ASAuthorizationAppleIDCredential setFullName:](v4, "setFullName:", self->_fullName);
  -[ASAuthorizationAppleIDCredential setRealUserStatus:](v4, "setRealUserStatus:", self->_realUserStatus);
  -[ASAuthorizationAppleIDCredential setUserAgeRange:](v4, "setUserAgeRange:", self->_userAgeRange);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *user;
  id v5;

  user = self->_user;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", user, CFSTR("_user"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("_state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizedScopes, CFSTR("_authorizedScopes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizationCode, CFSTR("_authorizationCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identityToken, CFSTR("_identityToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_email, CFSTR("_email"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fullName, CFSTR("_fullName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_realUserStatus, CFSTR("_realUserStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_userAgeRange, CFSTR("_userAgeRange"));

}

- (ASAuthorizationAppleIDCredential)initWithCoder:(id)a3
{
  id v4;
  ASAuthorizationAppleIDCredential *v5;
  uint64_t v6;
  NSString *user;
  uint64_t v8;
  NSString *state;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *authorizedScopes;
  uint64_t v15;
  NSData *authorizationCode;
  uint64_t v17;
  NSData *identityToken;
  uint64_t v19;
  NSString *email;
  uint64_t v21;
  NSPersonNameComponents *fullName;
  ASAuthorizationAppleIDCredential *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ASAuthorizationAppleIDCredential;
  v5 = -[ASAuthorizationAppleIDCredential init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_user"));
    v6 = objc_claimAutoreleasedReturnValue();
    user = v5->_user;
    v5->_user = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_state"));
    v8 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_authorizedScopes"));
    v13 = objc_claimAutoreleasedReturnValue();
    authorizedScopes = v5->_authorizedScopes;
    v5->_authorizedScopes = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_authorizationCode"));
    v15 = objc_claimAutoreleasedReturnValue();
    authorizationCode = v5->_authorizationCode;
    v5->_authorizationCode = (NSData *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identityToken"));
    v17 = objc_claimAutoreleasedReturnValue();
    identityToken = v5->_identityToken;
    v5->_identityToken = (NSData *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_email"));
    v19 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fullName"));
    v21 = objc_claimAutoreleasedReturnValue();
    fullName = v5->_fullName;
    v5->_fullName = (NSPersonNameComponents *)v21;

    v5->_realUserStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_realUserStatus"));
    v5->_userAgeRange = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_userAgeRange"));
    v23 = v5;
  }

  return v5;
}

- (NSString)user
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_user;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setUser:(id)a3
{
  NSString *v4;
  NSString *user;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  user = self->_user;
  self->_user = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)state
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_state;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setState:(id)a3
{
  NSString *v4;
  NSString *state;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  state = self->_state;
  self->_state = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSArray)authorizedScopes
{
  os_unfair_lock_s *p_internalLock;
  NSArray *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_authorizedScopes;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setAuthorizedScopes:(id)a3
{
  NSArray *v4;
  NSArray *authorizedScopes;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  authorizedScopes = self->_authorizedScopes;
  self->_authorizedScopes = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSData)authorizationCode
{
  os_unfair_lock_s *p_internalLock;
  NSData *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_authorizationCode;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setAuthorizationCode:(id)a3
{
  NSData *v4;
  NSData *authorizationCode;

  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  authorizationCode = self->_authorizationCode;
  self->_authorizationCode = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSData)identityToken
{
  os_unfair_lock_s *p_internalLock;
  NSData *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_identityToken;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setIdentityToken:(id)a3
{
  NSData *v4;
  NSData *identityToken;

  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  identityToken = self->_identityToken;
  self->_identityToken = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)email
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_email;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setEmail:(id)a3
{
  NSString *v4;
  NSString *email;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  email = self->_email;
  self->_email = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSPersonNameComponents)fullName
{
  os_unfair_lock_s *p_internalLock;
  NSPersonNameComponents *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_fullName;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setFullName:(id)a3
{
  NSPersonNameComponents *v4;
  NSPersonNameComponents *fullName;

  v4 = (NSPersonNameComponents *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  fullName = self->_fullName;
  self->_fullName = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSData)accessToken
{
  os_unfair_lock_s *p_internalLock;
  NSData *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_accessToken;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setAccessToken:(id)a3
{
  NSData *v4;
  NSData *accessToken;

  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  accessToken = self->_accessToken;
  self->_accessToken = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSData)refreshToken
{
  os_unfair_lock_s *p_internalLock;
  NSData *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_refreshToken;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRefreshToken:(id)a3
{
  NSData *v4;
  NSData *refreshToken;

  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  refreshToken = self->_refreshToken;
  self->_refreshToken = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (ASUserDetectionStatus)realUserStatus
{
  os_unfair_lock_s *p_internalLock;
  ASUserDetectionStatus realUserStatus;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  realUserStatus = self->_realUserStatus;
  os_unfair_lock_unlock(p_internalLock);
  return realUserStatus;
}

- (void)setRealUserStatus:(int64_t)a3
{
  os_unfair_lock_s *p_internalLock;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_realUserStatus = a3;
  os_unfair_lock_unlock(p_internalLock);
}

- (int64_t)userAgeRange
{
  os_unfair_lock_s *p_internalLock;
  int64_t userAgeRange;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  userAgeRange = self->_userAgeRange;
  os_unfair_lock_unlock(p_internalLock);
  return userAgeRange;
}

- (void)setUserAgeRange:(int64_t)a3
{
  os_unfair_lock_s *p_internalLock;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_userAgeRange = a3;
  os_unfair_lock_unlock(p_internalLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizedScopes, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_authorizationCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
