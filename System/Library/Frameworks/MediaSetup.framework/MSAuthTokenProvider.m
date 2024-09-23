@implementation MSAuthTokenProvider

+ (void)fetchAuthTokensForMediaService:(id)a3 networkActivity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "authConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "set_sourceApplicationBundleIdentifier:", v13);

    _MSLogingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_impl(&dword_219CD8000, v14, OS_LOG_TYPE_INFO, "AuthFetch: Setting sourceApplicationBundleID to %@", buf, 0xCu);

    }
    objc_msgSend(v8, "authConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "authCredential");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSOAuthTokenHandler tokenHandlerWithConfiguration:existingCredential:URLSessionConfiguration:parentNetworkActivity:](MSOAuthTokenHandler, "tokenHandlerWithConfiguration:existingCredential:URLSessionConfiguration:parentNetworkActivity:", v16, v17, v12, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, a1);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __81__MSAuthTokenProvider_fetchAuthTokensForMediaService_networkActivity_completion___block_invoke;
    v20[3] = &unk_24DBD53D0;
    objc_copyWeak(&v23, (id *)buf);
    v22 = v10;
    v21 = v8;
    objc_msgSend(v18, "fetchTokens:", v20);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    _MSLogingFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[MSAuthTokenProvider fetchAuthTokensForMediaService:networkActivity:completion:].cold.1(v8, v19);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
  }

}

void __81__MSAuthTokenProvider_fetchAuthTokensForMediaService_networkActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void (*v15)(void);
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v8 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "setAuthCredential:", v5);
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mediasetup.errorDomain")))
      {
        v10 = objc_msgSend(v6, "code");

        if (v10 == 8)
          objc_msgSend(*v8, "setAuthFatalError:", 1);
      }
      else
      {

      }
      _MSLogingFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __81__MSAuthTokenProvider_fetchAuthTokensForMediaService_networkActivity_completion___block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v6, v16);

      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      objc_msgSend(*v8, "setAuthFatalError:", 0);
      _MSLogingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*v8, "serviceID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138477827;
        v18 = v14;
        _os_log_impl(&dword_219CD8000, v13, OS_LOG_TYPE_DEFAULT, "Successfully fetched authTokens for service %{private}@", (uint8_t *)&v17, 0xCu);

      }
      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v15();
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
}

+ (void)validateConfigurationResourceForMediaService:(id)a3 networkActivity:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a5;
  objc_msgSend(v6, "authCredential");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "authCredential");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "authHeader");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  _MSLogingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configPublicKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_219CD8000, v11, OS_LOG_TYPE_DEFAULT, "Validating mediaService for %@ with public key: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "set_sourceApplicationBundleIdentifier:", v15);

  _MSLogingFacility();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v17;
    _os_log_impl(&dword_219CD8000, v16, OS_LOG_TYPE_INFO, "ConfigFetch: Setting sourceApplicationBundleID to %@", buf, 0xCu);

  }
  v18 = (void *)MEMORY[0x24BE17970];
  objc_msgSend(v6, "configURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configPublicKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CMSCloudExtensionLanguageCode();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __95__MSAuthTokenProvider_validateConfigurationResourceForMediaService_networkActivity_completion___block_invoke;
  v27[3] = &unk_24DBD53F8;
  v28 = v7;
  v25 = v7;
  objc_msgSend(v18, "configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:keyID:publicKey:URLSessionConfiguration:languageCode:completion:", v19, v21, v26, 0, 0, v22, v23, v14, v24, v27);

}

void __95__MSAuthTokenProvider_validateConfigurationResourceForMediaService_networkActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = CFSTR("Missing configuration resource");
  if (v5 && !v6)
  {
    objc_msgSend(v5, "configForEndpoint:", *MEMORY[0x24BE17968]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

      v10 = 0;
      goto LABEL_9;
    }
    v8 = CFSTR("Invalid configuration resource");
  }
  _MSLogingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __95__MSAuthTokenProvider_validateConfigurationResourceForMediaService_networkActivity_completion___block_invoke_cold_1((uint64_t)v7, v11, v12);

  v13 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BDD0FC8];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 10, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)fetchAuthTokensForMediaService:(void *)a1 networkActivity:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "serviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138477827;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_219CD8000, a2, v4, "Failed to fetch authTokens for service %{private}@ - mediaService missing authConfig", (uint8_t *)&v5);

}

void __81__MSAuthTokenProvider_fetchAuthTokensForMediaService_networkActivity_completion___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "serviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = v5;
  v8 = 2113;
  v9 = a2;
  _os_log_error_impl(&dword_219CD8000, a3, OS_LOG_TYPE_ERROR, "Failed to fetch authTokens for service %{private}@. Error: %{private}@", (uint8_t *)&v6, 0x16u);

}

void __95__MSAuthTokenProvider_validateConfigurationResourceForMediaService_networkActivity_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_219CD8000, a2, a3, "Encountered an issue trying to attain configuration resource: %@", (uint8_t *)&v3);
}

@end
