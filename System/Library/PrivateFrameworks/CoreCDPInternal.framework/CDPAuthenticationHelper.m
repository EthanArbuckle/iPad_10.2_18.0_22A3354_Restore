@implementation CDPAuthenticationHelper

+ (void)silentAuthenticationForPrimaryAccountWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_contextForPrimaryAccountSilentAuth");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_authWithContext:completion:", v5, v4);

}

+ (void)silentAuthenticationForPrimaryAccountWithClientAppName:(id)a3 clientAppBundleId:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "_contextForPrimaryAccountSilentAuth");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setProxiedAppName:", v10);

  objc_msgSend(v11, "_setProxiedAppBundleID:", v9);
  objc_msgSend(a1, "_authWithContext:completion:", v11, v8);

}

+ (void)silentAuthenticationForContext:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_authContextForContext:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAuthenticationType:", 1);
  objc_msgSend(v8, "setIsUsernameEditable:", 0);
  objc_msgSend(a1, "_authWithContext:completion:", v8, v6);

}

+ (id)authController
{
  return objc_alloc_init(MEMORY[0x24BE0ACC0]);
}

+ (void)_authWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _TtC15CoreCDPInternal28CDPExponentialRetryScheduler *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_TtC15CoreCDPInternal28CDPExponentialRetryScheduler);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__CDPAuthenticationHelper__authWithContext_completion___block_invoke;
  v9[3] = &unk_24C81BFF0;
  v10 = v5;
  v8 = v5;
  -[CDPExponentialRetryScheduler retrySilentAuthWithAuthContext:completionHandler:](v7, "retrySilentAuthWithAuthContext:completionHandler:", v6, v9);

}

void __55__CDPAuthenticationHelper__authWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__CDPAuthenticationHelper__authWithContext_completion___block_invoke_cold_2((uint64_t)v6, v8);

    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_10:
      v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __55__CDPAuthenticationHelper__authWithContext_completion___block_invoke_cold_1((uint64_t)v5, v8);

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_10;
    }
  }

}

+ (id)_contextForPrimaryAccountSilentAuth
{
  void *v2;

  objc_msgSend(a1, "_contextForPrimaryAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAuthenticationType:", 1);
  objc_msgSend(v2, "setIsUsernameEditable:", 0);
  return v2;
}

+ (id)_authContextForContext:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BE0ACB8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "dsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDSID:", v7);

  objc_msgSend(v4, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAltDSID:", v8);

  objc_msgSend(v4, "appleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsername:", v9);

  objc_msgSend(v4, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_setPassword:", v10);
  return v5;
}

+ (id)_contextForPrimaryAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAccountAltDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryAccountUsername");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BE0ACB8]);
  objc_msgSend(v6, "setAltDSID:", v3);
  objc_msgSend(v6, "setUsername:", v5);

  return v6;
}

void __55__CDPAuthenticationHelper__authWithContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"Fetched authentication results: %@\", (uint8_t *)&v2, 0xCu);
}

void __55__CDPAuthenticationHelper__authWithContext_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to fetch authentication results due to %@\", (uint8_t *)&v2, 0xCu);
}

@end
