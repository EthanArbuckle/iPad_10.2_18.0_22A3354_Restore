@implementation XAMLocalAuthenticationProvider

- (id)localizedAuthorizationReason
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Authorize UI Automation Prompt"), CFSTR("Enable UI Automation"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_makeAuthorizationContext
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = (void *)objc_opt_new();
  XAMLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22D1E0000, v3, OS_LOG_TYPE_DEFAULT, "Setting context caller name to XCTest", v5, 2u);
  }

  objc_msgSend(v2, "setOptionCallerName:", CFSTR("XCTest"));
  return v2;
}

- (void)requestAuthorizationWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[XAMLocalAuthenticationProvider _makeAuthorizationContext](self, "_makeAuthorizationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[XAMLocalAuthenticationProvider localizedAuthorizationReason](self, "localizedAuthorizationReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__XAMLocalAuthenticationProvider_requestAuthorizationWithReply___block_invoke;
  v9[3] = &unk_24F8692F0;
  v10 = v5;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v7, "evaluatePolicy:localizedReason:reply:", 2, v6, v9);

}

uint64_t __64__XAMLocalAuthenticationProvider_requestAuthorizationWithReply___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
}

- (id)authorizationWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[XAMLocalAuthenticationProvider _makeAuthorizationContext](self, "_makeAuthorizationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = &unk_24F86A388;
  -[XAMLocalAuthenticationProvider localizedAuthorizationReason](self, "localizedAuthorizationReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluatePolicy:options:error:", 2, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  XAMLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_22D1E0000, v9, OS_LOG_TYPE_DEFAULT, "Sync evaluate policy returned %{public}@", (uint8_t *)&v13, 0xCu);
  }

  if (v8)
    v10 = v5;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

@end
