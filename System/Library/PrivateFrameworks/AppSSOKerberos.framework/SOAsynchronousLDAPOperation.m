@implementation SOAsynchronousLDAPOperation

- (SOAsynchronousLDAPOperation)initWithRealm:(id)a3 andHost:(id)a4 andPort:(unsigned __int16)a5 andBundleIdentifier:(id)a6 andRequireTLSForLDAP:(BOOL)a7 andCompletion:(id)a8
{
  _BOOL8 v9;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  SOAsynchronousLDAPOperation *v18;
  SOAsynchronousLDAPOperation *v19;
  objc_super v21;

  v9 = a7;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)SOAsynchronousLDAPOperation;
  v18 = -[SOAsynchronousOperation init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    -[SOAsynchronousLDAPOperation setRealm:](v18, "setRealm:", v14);
    -[SOAsynchronousLDAPOperation setHost:](v19, "setHost:", v15);
    -[SOAsynchronousLDAPOperation setPort:](v19, "setPort:", v11);
    -[SOAsynchronousLDAPOperation setCompletion:](v19, "setCompletion:", v17);
    -[SOAsynchronousLDAPOperation setBundleIdentifier:](v19, "setBundleIdentifier:", v16);
    -[SOAsynchronousLDAPOperation setRequireTLSForLDAP:](v19, "setRequireTLSForLDAP:", v9);
  }

  return v19;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "Start of ldap operation for host: %{public}@", v5);

  OUTLINED_FUNCTION_8();
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v5 = a3;
  SO_LOG_SOAsynchronousLDAPOperation();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v7)
      __35__SOAsynchronousLDAPOperation_main__block_invoke_cold_1(a1, v6);

    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __35__SOAsynchronousLDAPOperation_main__block_invoke_6;
    v13[3] = &unk_24D3EC2A0;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 32);
    v14 = v10;
    v15 = v11;
    objc_msgSend(v10, "queryforBaseDN:andScope:andAttributes:withFilter:completion:", &stru_24D3EC758, 0, &unk_24D3F2C70, v9, v13);

  }
  else
  {
    if (v7)
      __35__SOAsynchronousLDAPOperation_main__block_invoke_cold_2(a1);

    objc_msgSend(*(id *)(a1 + 32), "completion");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, 0);

    objc_msgSend(*(id *)(a1 + 40), "disconnect");
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }

}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_6(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  NSObject *v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "disconnect");
  if (a2)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("netlogon"));
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SO_LOG_SOAsynchronousLDAPOperation();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __35__SOAsynchronousLDAPOperation_main__block_invoke_6_cold_2();

    +[SONetLogonParser parseNetLoginUsingData:](SONetLogonParser, "parseNetLoginUsingData:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    SO_LOG_SOAsynchronousLDAPOperation();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __35__SOAsynchronousLDAPOperation_main__block_invoke_6_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "completion");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v17)[2](v17, 1, v15);

  }
  else
  {
    SO_LOG_SOAsynchronousLDAPOperation();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __35__SOAsynchronousLDAPOperation_main__block_invoke_6_cold_3(a1);

    objc_msgSend(*(id *)(a1 + 40), "completion");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, 0);
  }

  objc_msgSend(*(id *)(a1 + 40), "finish");
}

- (id)completion
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
  objc_storeStrong((id *)&self->_realm, a3);
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (BOOL)requireTLSForLDAP
{
  return self->_requireTLSForLDAP;
}

- (void)setRequireTLSForLDAP:(BOOL)a3
{
  self->_requireTLSForLDAP = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong(&self->_completion, 0);
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "connected to host: %{public}@", v5);

  OUTLINED_FUNCTION_8();
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_215A1B000, v2, v3, "error with ldap connection for host: %@, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_1();
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "netlogon response: %{public}@", v2);
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_6_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "response from ldap: %{public}@", v2);
}

void __35__SOAsynchronousLDAPOperation_main__block_invoke_6_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_215A1B000, v2, v3, "error with netlogon ping for host: %{public}@, %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_1();
}

@end
