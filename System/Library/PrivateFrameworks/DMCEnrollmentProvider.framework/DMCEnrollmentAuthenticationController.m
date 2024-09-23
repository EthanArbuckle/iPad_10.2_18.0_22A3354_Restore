@implementation DMCEnrollmentAuthenticationController

- (void)fetchAuthenticationModeForUsername:(id)a3 requireAppleMAID:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE2A7F0], "simluatedMDMAccountDrivenEnrollmentAuthenticationResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __111__DMCEnrollmentAuthenticationController_fetchAuthenticationModeForUsername_requireAppleMAID_completionHandler___block_invoke;
    block[3] = &unk_24D52E780;
    v14 = v8;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v11, "setUsername:", v7);
    objc_msgSend(v11, "setIsEphemeral:", 1);
    if (v6 && (objc_msgSend(MEMORY[0x24BE2A7F0], "allowAnyMAIDToSignIn") & 1) == 0)
      objc_msgSend(v11, "setAppProvidedContext:", *MEMORY[0x24BE60DC8]);
    objc_msgSend(v12, "fetchAuthModeWithContext:completion:", v11, v8);

  }
}

uint64_t __111__DMCEnrollmentAuthenticationController_fetchAuthenticationModeForUsername_requireAppleMAID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)authenticateWithUsername:(id)a3 password:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 presentingViewController:(id)a7 completionHandler:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  const __CFString *v28;
  _QWORD v29[2];

  v9 = a6;
  v10 = a5;
  v29[1] = *MEMORY[0x24BDAC8D0];
  v13 = a8;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setUsername:", v16);

  objc_msgSend(v17, "_setPassword:", v15);
  objc_msgSend(v17, "setPresentingViewController:", v14);

  objc_msgSend(v17, "setIsEphemeral:", v10);
  objc_msgSend(v17, "setIsUsernameEditable:", 0);
  v28 = CFSTR("shouldAllowManagedAppleIDOnly");
  v29[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  if (v10)
  {
    v20 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("upgradeTokenWithTrust"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("PreMDMEnrolledDevice"));
  }
  v21 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v17, "setAppProvidedData:", v21);

  objc_msgSend(v17, "setAuthenticationType:", 0);
  if (v9 && (objc_msgSend(MEMORY[0x24BE2A7F0], "allowAnyMAIDToSignIn") & 1) == 0)
  {
    objc_msgSend(v17, "setAppProvidedContext:", *MEMORY[0x24BE60DC8]);
    v27 = *MEMORY[0x24BE60ED8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setServiceIdentifiers:", v22);

  }
  v23 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __145__DMCEnrollmentAuthenticationController_authenticateWithUsername_password_ephemeral_requireAppleMAID_presentingViewController_completionHandler___block_invoke;
  v25[3] = &unk_24D52E4B0;
  v26 = v13;
  v24 = v13;
  objc_msgSend(v23, "authenticateWithContext:completion:", v17, v25);

}

void __145__DMCEnrollmentAuthenticationController_authenticateWithUsername_password_ephemeral_requireAppleMAID_presentingViewController_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_DEFAULT, "Authentication finished with results: %@, error: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE0AB28]))
    {
      v9 = objc_msgSend(v6, "code");

      if (v9 == -7003)
      {
        v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_9:
        v10();
        goto LABEL_10;
      }
    }
    else
    {

    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)authenticateWithAuthenticationResults:(id)a3 ephemeral:(BOOL)a4 requireAppleMAID:(BOOL)a5 presentingViewController:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v9 = a5;
  v10 = a4;
  v28[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABF0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUsername:", v15);

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAltDSID:", v16);

  objc_msgSend(v14, "setPresentingViewController:", v13);
  objc_msgSend(v14, "setIsEphemeral:", v10);
  objc_msgSend(v14, "setAuthenticationType:", 1);
  objc_msgSend(v14, "setIsUsernameEditable:", 0);
  v27 = CFSTR("shouldAllowManagedAppleIDOnly");
  v28[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v10)
  {
    v19 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("upgradeTokenWithTrust"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("PreMDMEnrolledDevice"));
  }
  v20 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v14, "setAppProvidedData:", v20);

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABA0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setIdentityToken:", v21);

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB58]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v14, "setIsMDMInformationRequired:", objc_msgSend(v22, "BOOLValue"));
  if (v9 && (objc_msgSend(MEMORY[0x24BE2A7F0], "allowAnyMAIDToSignIn") & 1) == 0)
    objc_msgSend(v14, "setAppProvidedContext:", *MEMORY[0x24BE60DC8]);
  v23 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __149__DMCEnrollmentAuthenticationController_authenticateWithAuthenticationResults_ephemeral_requireAppleMAID_presentingViewController_completionHandler___block_invoke;
  v25[3] = &unk_24D52E4B0;
  v26 = v12;
  v24 = v12;
  objc_msgSend(v23, "authenticateWithContext:completion:", v14, v25);

}

void __149__DMCEnrollmentAuthenticationController_authenticateWithAuthenticationResults_ephemeral_requireAppleMAID_presentingViewController_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_DEFAULT, "Authentication finished with results: %@, error: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE0AB28]))
    {
      v9 = objc_msgSend(v6, "code");

      if (v9 == -7003)
      {
        v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_9:
        v10();
        goto LABEL_10;
      }
    }
    else
    {

    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_9;
  }
LABEL_10:

}

@end
