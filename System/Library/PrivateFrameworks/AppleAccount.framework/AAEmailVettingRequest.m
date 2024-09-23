@implementation AAEmailVettingRequest

- (AAEmailVettingRequest)initWithAccount:(id)a3
{
  id v4;
  AAEmailVettingRequest *v5;
  AAEmailVettingRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AAEmailVettingRequest;
  v5 = -[AAEmailVettingRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AAEmailVettingRequest setAccount:](v5, "setAccount:", v4);

  return v6;
}

- (AAEmailVettingRequest)initWithURLString:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AAEmailVettingRequest *v10;
  AAEmailVettingRequest *v11;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$APPLE_ID$"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)AAEmailVettingRequest;
  v10 = -[AARequest initWithURLString:](&v13, sel_initWithURLString_, v9);
  v11 = v10;
  if (v10)
    -[AAEmailVettingRequest setAccount:](v10, "setAccount:", v6);

  return v11;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)AAEmailVettingRequest;
  -[AARequest urlRequest](&v15, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  -[AAEmailVettingRequest account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v5, 0);

  -[AARequest bodyDictionary](self, "bodyDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_setBodyWithParameters:", v6);
  objc_msgSend(v4, "HTTPBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = objc_retainAutorelease(v7);
  v10 = (void *)objc_msgSend(v8, "initWithBytes:length:encoding:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 4);
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Content-Type"));
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("Authorization"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v13;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  return v4;
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
}

@end
