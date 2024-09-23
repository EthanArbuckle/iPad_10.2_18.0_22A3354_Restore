@implementation CPSStoreAuthenticationRequest

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_authenticationRequest, CFSTR("authenticationRequest"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_account, CFSTR("account"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)authType
{
  return 11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSStoreAuthenticationRequest)initWithCoder:(id)a3
{
  id v4;
  CPSStoreAuthenticationRequest *v5;
  uint64_t v6;
  AMSDelegateAuthenticateRequest *authenticationRequest;
  void *v8;
  uint64_t v9;
  ACAccount *account;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPSStoreAuthenticationRequest;
  v5 = -[CPSStoreAuthenticationRequest init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", getAMSDelegateAuthenticateRequestClass(), CFSTR("authenticationRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    authenticationRequest = v5->_authenticationRequest;
    v5->_authenticationRequest = (AMSDelegateAuthenticateRequest *)v6;

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("account"));
    v9 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  AMSDelegateAuthenticateRequest *authenticationRequest;
  id v5;

  authenticationRequest = self->_authenticationRequest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", authenticationRequest, CFSTR("authenticationRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_account, CFSTR("account"));

}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BE0BEC8], "coderWithMessage:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSDelegateAuthenticateRequest challenge](self->_authenticationRequest, "challenge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("authenticationRequestChallenge"));

  -[AMSDelegateAuthenticateRequest userAgent](self->_authenticationRequest, "userAgent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("authenticationRequestUserAgent"));

  -[ACAccount ams_altDSID](self->_account, "ams_altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("accountAltDSID"));

  -[ACAccount ams_DSID](self->_account, "ams_DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("accountDSID"));

  -[ACAccount username](self->_account, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("accountUsername"));

}

- (CPSStoreAuthenticationRequest)initWithXPCDictionary:(id)a3
{
  id v4;
  CPSStoreAuthenticationRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  AMSDelegateAuthenticateRequest *authenticationRequest;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id ACAccountStoreClass;
  void *v16;
  void *v17;
  uint64_t v18;
  ACAccount *account;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CPSStoreAuthenticationRequest;
  v5 = -[CPSStoreAuthenticationRequest init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE0BEC8], "coderWithMessage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeStringForKey:", CFSTR("authenticationRequestChallenge"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeStringForKey:", CFSTR("authenticationRequestUserAgent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc((Class)getAMSDelegateAuthenticateRequestClass()), "initWithChallenge:userAgent:", v7, v8);
    authenticationRequest = v5->_authenticationRequest;
    v5->_authenticationRequest = (AMSDelegateAuthenticateRequest *)v9;

    objc_msgSend(v6, "decodeStringForKey:", CFSTR("accountAltDSID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v12, CFSTR("accountDSID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "decodeStringForKey:", CFSTR("accountUsername"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ACAccountStoreClass = getACAccountStoreClass();
    getAMSAccountMediaTypeProduction();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(ACAccountStoreClass, "ams_sharedAccountStoreForMediaType:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ams_iTunesAccountWithAltDSID:DSID:username:", v11, v13, v14);
    v18 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v18;

  }
  return v5;
}

- (AMSDelegateAuthenticateRequest)authenticationRequest
{
  return self->_authenticationRequest;
}

- (void)setAuthenticationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationRequest, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authenticationRequest, 0);
}

@end
