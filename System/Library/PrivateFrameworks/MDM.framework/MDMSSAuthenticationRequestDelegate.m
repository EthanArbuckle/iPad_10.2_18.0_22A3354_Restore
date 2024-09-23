@implementation MDMSSAuthenticationRequestDelegate

+ (id)instanceWithAuthenticationContext:(id)a3
{
  id v3;
  MDMSSAuthenticationRequestDelegate *v4;
  void *v5;
  MDMSSAuthenticationRequestDelegate *v6;

  v3 = a3;
  v4 = [MDMSSAuthenticationRequestDelegate alloc];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DB8]), "initWithAuthenticationContext:", v3);

  v6 = -[MDMSSRequestDelegate initWithRequest:](v4, "initWithRequest:", v5);
  return v6;
}

- (id)storeLoginFailedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A6C0];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 30000, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)startWithCompletionBlock:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  void (**v12)(id, void *, _QWORD);
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = +[MDMMCInterface isLimitedAppsMode](MDMMCInterface, "isLimitedAppsMode");
  v6 = *(NSObject **)DMCLogObjects();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Not prompting for iTunes account in a limited apps mode.", buf, 2u);
    }
    if (v4)
    {
      -[MDMSSAuthenticationRequestDelegate storeLoginFailedError](self, "storeLoginFailedError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8, 0);

    }
  }
  else
  {
    if (v7)
    {
      v9 = v6;
      *(_DWORD *)buf = 138543362;
      v14 = (id)objc_opt_class();
      v10 = v14;
      _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ starting user authentication.", buf, 0xCu);

    }
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __63__MDMSSAuthenticationRequestDelegate_startWithCompletionBlock___block_invoke;
    v11[3] = &unk_24EB699D0;
    v11[4] = self;
    v12 = v4;
    -[MDMSSRequestDelegate _startTimeout:completionBlock:](self, "_startTimeout:completionBlock:", v11, 900.0);

  }
}

void __63__MDMSSAuthenticationRequestDelegate_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  if (v8)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      (*(void (**)(_QWORD))(v6 + 16))(*(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "storeLoginFailedError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

    }
  }

}

- (void)authenticateRequest:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  SSAccount *v8;
  SSAccount *authenticatedAccount;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_msgSend(v5, "authenticateResponseType");
  v7 = *(NSObject **)DMCLogObjects();
  if (v6 == 4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_DEFAULT, "User successfully logged into iTunes account.", (uint8_t *)&v11, 2u);
    }
    objc_msgSend(v5, "authenticatedAccount");
    v8 = (SSAccount *)objc_claimAutoreleasedReturnValue();
    authenticatedAccount = self->_authenticatedAccount;
    self->_authenticatedAccount = v8;

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v10 = v7;
    v11 = 134217984;
    v12 = objc_msgSend(v5, "authenticateResponseType");
    _os_log_impl(&dword_222CB9000, v10, OS_LOG_TYPE_ERROR, "User failed to log into iTunes account. Reason code: %ld", (uint8_t *)&v11, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedAccount, 0);
}

@end
