@implementation AMSAuthenticateRequest

- (AMSAuthenticateRequest)initWithAccount:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  AMSAuthenticateRequest *v9;
  AMSAuthenticateRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAuthenticateRequest;
  v9 = -[AMSAuthenticateRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (AMSAuthenticateRequest)initWithDSID:(id)a3 altDSID:(id)a4 username:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AMSAuthenticateRequest *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ams_iTunesAccountWithAltDSID:DSID:username:", v11, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_ams_accountTypeWithAccountTypeIdentifier:error:", *MEMORY[0x1E0C8F170], 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v17);
    objc_msgSend(v15, "setUsername:", v12);
    objc_msgSend(v15, "ams_setDSID:", v10);
    objc_msgSend(v15, "ams_setAltDSID:", v11);

  }
  v18 = -[AMSAuthenticateRequest initWithAccount:options:](self, "initWithAccount:options:", v15, v13);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AMSAuthenticateRequest account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSAuthenticateRequest account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("kCodingKeyAccount"));

  }
  if (-[AMSAuthenticateRequest isServerRequested](self, "isServerRequested"))
    objc_msgSend(v13, "encodeBool:forKey:", -[AMSAuthenticateRequest isServerRequested](self, "isServerRequested"), CFSTR("kCodingKeyIsServerRequested"));
  -[AMSAuthenticateRequest logKey](self, "logKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSAuthenticateRequest logKey](self, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("kCodingKeyLogKey"));

  }
  -[AMSAuthenticateRequest options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSAuthenticateRequest options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("kCodingKeyOptions"));

  }
  -[AMSAuthenticateRequest userInfo](self, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[AMSAuthenticateRequest userInfo](self, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("kCodingKeyUserInfo"));

    v11 = v13;
  }

}

- (AMSAuthenticateRequest)initWithCoder:(id)a3
{
  id v4;
  AMSAuthenticateRequest *v5;
  uint64_t v6;
  ACAccount *account;
  uint64_t v8;
  NSString *logKey;
  uint64_t v10;
  AMSAuthenticateOptions *options;
  void *v12;
  uint64_t v13;
  NSDictionary *userInfo;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSAuthenticateRequest;
  v5 = -[AMSAuthenticateRequest init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyAccount"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    v5->_isServerRequested = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCodingKeyIsServerRequested"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyLogKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyOptions"));
    v10 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (AMSAuthenticateOptions *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("kCodingKeyUserInfo"));
    v13 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSAuthenticateRequest account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("account"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSAuthenticateRequest isServerRequested](self, "isServerRequested"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, CFSTR("server requested"));

  -[AMSAuthenticateRequest logKey](self, "logKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, CFSTR("logKey"));

  -[AMSAuthenticateRequest options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, CFSTR("options"));

  -[AMSAuthenticateRequest userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, CFSTR("userInfo"));

  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)isServerRequested
{
  return self->_isServerRequested;
}

- (void)setIsServerRequested:(BOOL)a3
{
  self->_isServerRequested = a3;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (AMSAuthenticateOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
