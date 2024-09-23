@implementation _AABasicGetRequest

- (_AABasicGetRequest)initWithAccount:(id)a3
{
  id v5;
  _AABasicGetRequest *v6;
  _AABasicGetRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AABasicGetRequest;
  v6 = -[_AABasicGetRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)urlRequest
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_account)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AARequest.m"), 1538, CFSTR("%@ cannot run without an ACAccount."), v5);

  }
  v12.receiver = self;
  v12.super_class = (Class)_AABasicGetRequest;
  -[AARequest urlRequest](&v12, sel_urlRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setHTTPMethod:", CFSTR("GET"));
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Sending GET to %@", buf, 0xCu);

  }
  objc_msgSend(v7, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
