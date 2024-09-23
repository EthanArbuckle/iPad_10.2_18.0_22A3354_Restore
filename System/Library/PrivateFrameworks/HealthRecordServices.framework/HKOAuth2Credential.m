@implementation HKOAuth2Credential

- (HKOAuth2Credential)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKOAuth2Credential)initWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopeString:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKOAuth2Credential *v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a7)
  {
    +[HKOAuth2ScopeSet scopesFromScopeString:](HKOAuth2ScopeSet, "scopesFromScopeString:", a7);
    a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = -[HKOAuth2Credential initWithAccessToken:refreshToken:expiration:requestedScopeString:scopes:](self, "initWithAccessToken:refreshToken:expiration:requestedScopeString:scopes:", v12, v13, v14, v15, a7);

  return v16;
}

- (HKOAuth2Credential)initWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKOAuth2Credential *v17;
  HKOAuth2Credential *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HKOAuth2Credential;
  v17 = -[HKOAuth2Credential init](&v20, sel_init);
  v18 = v17;
  if (v17)
    -[HKOAuth2Credential _commonInitWithAccessToken:refreshToken:expiration:requestedScopeString:scopes:](v17, "_commonInitWithAccessToken:refreshToken:expiration:requestedScopeString:scopes:", v12, v13, v14, v15, v16);

  return v18;
}

- (void)_commonInitWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSString *v16;
  NSString *accessToken;
  NSString *v18;
  NSString *refreshToken;
  NSDate *v20;
  NSDate *expiration;
  NSString *v22;
  NSString *requestedScopeString;
  NSSet *v24;
  NSSet *scopes;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (NSString *)objc_msgSend(a3, "copy");
  accessToken = self->_accessToken;
  self->_accessToken = v16;

  v18 = (NSString *)objc_msgSend(v15, "copy");
  refreshToken = self->_refreshToken;
  self->_refreshToken = v18;

  v20 = (NSDate *)objc_msgSend(v14, "copy");
  expiration = self->_expiration;
  self->_expiration = v20;

  v22 = (NSString *)objc_msgSend(v13, "copy");
  requestedScopeString = self->_requestedScopeString;
  self->_requestedScopeString = v22;

  v24 = (NSSet *)objc_msgSend(v12, "copy");
  scopes = self->_scopes;
  self->_scopes = v24;

}

- (BOOL)isEqual:(id)a3
{
  HKOAuth2Credential *v4;
  BOOL v5;

  v4 = (HKOAuth2Credential *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[HKOAuth2Credential isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[HKOAuth2Credential isEqualToCredential:epsilonExpiration:](self, "isEqualToCredential:epsilonExpiration:", v4, 0.0);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToCredential:(id)a3 epsilonExpiration:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSString *accessToken;
  NSString *v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  NSString *refreshToken;
  NSString *v17;
  uint64_t v18;
  void *v19;
  NSString *v20;
  void *v21;
  char v22;
  double v23;
  NSString *requestedScopeString;
  NSString *v25;
  uint64_t v26;
  NSString *v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  NSSet *scopes;
  uint64_t v32;
  uint64_t v33;
  NSSet *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v6 = a3;
  -[HKOAuth2Credential expiration](self, "expiration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expiration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  accessToken = self->_accessToken;
  objc_msgSend(v6, "accessToken");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (accessToken != v12)
  {
    objc_msgSend(v6, "accessToken");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v22 = 0;
      goto LABEL_35;
    }
    v8 = (void *)v13;
    v14 = self->_accessToken;
    objc_msgSend(v6, "accessToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v14, "isEqualToString:", v15))
    {
      v22 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v43 = v15;
  }
  refreshToken = self->_refreshToken;
  objc_msgSend(v6, "refreshToken");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (refreshToken != v17)
  {
    objc_msgSend(v6, "refreshToken");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v22 = 0;
      goto LABEL_39;
    }
    v19 = (void *)v18;
    v20 = self->_refreshToken;
    objc_msgSend(v6, "refreshToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](v20, "isEqualToString:", v21))
    {

      v22 = 0;
      goto LABEL_33;
    }
    v41 = v21;
    v42 = v19;
  }
  v23 = fabs(v10);
  requestedScopeString = self->_requestedScopeString;
  objc_msgSend(v6, "requestedScopeString");
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (requestedScopeString == v25)
  {
    if (v23 <= a4)
      goto LABEL_22;
LABEL_18:
    v22 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v6, "requestedScopeString");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
    goto LABEL_18;
  v40 = (void *)v26;
  v27 = self->_requestedScopeString;
  objc_msgSend(v6, "requestedScopeString");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v27;
  v30 = (void *)v28;
  if (!-[NSString isEqualToString:](v29, "isEqualToString:", v28))
  {

    v22 = 0;
    goto LABEL_37;
  }
  if (v23 > a4)
  {
    v22 = 0;
LABEL_29:

LABEL_30:
    if (refreshToken != v17)
    {

    }
    goto LABEL_32;
  }
  v38 = v30;
LABEL_22:
  scopes = self->_scopes;
  objc_msgSend(v6, "scopes");
  v32 = objc_claimAutoreleasedReturnValue();
  if (scopes == (NSSet *)v32)
  {

    v22 = 1;
    goto LABEL_28;
  }
  v39 = (void *)v32;
  objc_msgSend(v6, "scopes");
  v33 = objc_claimAutoreleasedReturnValue();
  if (!v33)
  {

    v22 = 0;
LABEL_28:
    v30 = v38;
    if (requestedScopeString == v25)
      goto LABEL_30;
    goto LABEL_29;
  }
  v34 = self->_scopes;
  v37 = (void *)v33;
  objc_msgSend(v6, "scopes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[NSSet isEqual:](v34, "isEqual:", v35);

  if (requestedScopeString == v25)
  {

  }
  else
  {

  }
LABEL_37:
  if (refreshToken != v17)
  {

LABEL_39:
    v15 = v43;

    if (accessToken == v12)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_32:

LABEL_33:
  v15 = v43;
  if (accessToken != v12)
    goto LABEL_34;
LABEL_35:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_accessToken, "hash");
  v4 = -[NSString hash](self->_refreshToken, "hash") ^ v3;
  v5 = -[NSString hash](self->_requestedScopeString, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_expiration, "hash");
  return v6 ^ -[NSSet hash](self->_scopes, "hash");
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accessToken;
  id v5;

  accessToken = self->_accessToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accessToken, CFSTR("accessToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_refreshToken, CFSTR("refreshToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiration, CFSTR("expiration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scopes, CFSTR("scopes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestedScopeString, CFSTR("requestedScopeString"));

}

- (HKOAuth2Credential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HKOAuth2Credential *v13;
  HKOAuth2Credential *v14;
  HKOAuth2Credential *v15;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("refreshToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("scopes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedScopeString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v17.receiver = self;
    v17.super_class = (Class)HKOAuth2Credential;
    v13 = -[HKOAuth2Credential init](&v17, sel_init);
    v14 = v13;
    if (v13)
      -[HKOAuth2Credential _commonInitWithAccessToken:refreshToken:expiration:requestedScopeString:scopes:](v13, "_commonInitWithAccessToken:refreshToken:expiration:requestedScopeString:scopes:", v5, v6, v7, v12, v11);
    self = v14;
    v15 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v9;

  -[HKOAuth2Credential accessToken](self, "accessToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[HKOAuth2Credential refreshToken](self, "refreshToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      return 1;
  }
  -[HKOAuth2Credential expiration](self, "expiration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x24BDBCE60]);
  -[HKOAuth2Credential expiration](self, "expiration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hk_isBeforeDate:", v5);

  return v7;
}

- (NSString)scopeString
{
  void *v2;

  if (self->_scopes)
  {
    objc_msgSend((id)objc_opt_class(), "scopeStringFromScopes:", self->_scopes);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringFromBool();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringFromBool();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; has access token: %@, has refresh token: %@, expiration: %@, scopes: %lu>"),
    v5,
    self,
    v6,
    v7,
    self->_expiration,
    -[NSSet count](self->_scopes, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)expirationFromTimeInterval:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
}

+ (id)scopeStringFromScopes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __44__HKOAuth2Credential_scopeStringFromScopes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:");
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (NSSet)scopes
{
  return self->_scopes;
}

- (NSString)requestedScopeString
{
  return self->_requestedScopeString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedScopeString, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
}

@end
