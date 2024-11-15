uint64_t sub_230E74F10(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 0, 0);
  _AIDALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_230E73000, v3, OS_LOG_TYPE_DEFAULT, "No luck with silent renewal. Trying interactive renewal for services: %@", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_attemptInteractiveCredentialRenewalForAccount:store:options:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void sub_230E751DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void (*v8)(void);
  uint8_t v9[16];

  v4 = a3;
  _AIDALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_230E75A38((uint64_t)v4, v6, v7);

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_230E73000, v6, OS_LOG_TYPE_DEFAULT, "Silent renewal succeeded!", v9, 2u);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

void sub_230E75374(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void (*v12)(void);
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  _AIDALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_230E75AA4((uint64_t)v6, v8, v9);

    objc_msgSend(v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", *MEMORY[0x24BE0AB28]))
    {
      v11 = objc_msgSend(v6, "code");

      if (v11 == -7003)
      {
        v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
        goto LABEL_12;
      }
    }
    else
    {

    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_12;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_230E73000, v8, OS_LOG_TYPE_DEFAULT, "Renewal succeeded!", v13, 2u);
  }

  v12 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_12:
  v12();

}

uint64_t sub_230E756B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v4)(void);
  void *v5;

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "credential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPassword:", 0);

    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v4();
}

void sub_230E759A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_230E759AC(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  sub_230E759A0(&dword_230E73000, a2, v4, "Client - %@ does not have the correct entitlements to get the master token", (uint8_t *)&v5);

}

void sub_230E75A38(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  sub_230E759A0(&dword_230E73000, a2, a3, "Silent renewal failed! Error: %@", (uint8_t *)&v3);
}

void sub_230E75AA4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  sub_230E759A0(&dword_230E73000, a2, a3, "Renew failed! Error: %@", (uint8_t *)&v3);
}

uint64_t _AIDALogSystem()
{
  return MEMORY[0x24BE060E8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
    objc_msgSend(v11, "setAuthenticationType:", 1);
  objc_msgSend(v11, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v7, "username");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsername:", v16);

  objc_msgSend(v10, "client");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setProxiedAppBundleID:", v18);

  objc_msgSend(v10, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setProxiedAppName:", v20);

  objc_msgSend(v11, "_setProxyingForApp:", 1);
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDB4520]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
    objc_msgSend(v11, "setServiceIdentifiers:", v21);

  return v11;
}

- (id)_silentAuthContextForAccount:(id)a3 rawPassword:(id)a4 store:(id)a5 options:(id)a6
{
  id v10;
  void *v11;

  v10 = a4;
  -[AppleIDSSOAuthenticationPlugin _standardAuthContextForAccount:store:options:](self, "_standardAuthContextForAccount:store:options:", a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAuthenticationType:", 1);
  objc_msgSend(v11, "_setPassword:", v10);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authController, 0);
}

@end
