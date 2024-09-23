@implementation SOHostExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_12);
  return (id)_extensionAuxiliaryHostProtocol___interface_0;
}

void __57__SOHostExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549EC0C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface_0;
  _extensionAuxiliaryHostProtocol___interface_0 = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_54_0);
  return (id)_extensionAuxiliaryVendorProtocol___interface_0;
}

void __59__SOHostExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DA3F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  _extensionAuxiliaryVendorProtocol___interface_0 = v0;

}

- (id)remoteContextWithError:(id *)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  -[SOHostExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SOHostExtensionContext_remoteContextWithError___block_invoke;
  v7[3] = &unk_24C80C180;
  v7[4] = &v8;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__SOHostExtensionContext_remoteContextWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  SO_LOG_SOHostExtensionContext();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__SOHostExtensionContext_remoteContextWithError___block_invoke_cold_1((uint64_t)v3, v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  SOHostExtensionContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOHostExtensionContext();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v15 = "-[SOHostExtensionContext openURL:completionHandler:]";
    v16 = 2160;
    v17 = 1752392040;
    v18 = 2117;
    v19 = v6;
    v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s URL: %{sensitive, mask.hash}@ on %@", buf, 0x2Au);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__SOHostExtensionContext_openURL_completionHandler___block_invoke;
  v11[3] = &unk_24C80CC10;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[SOHostExtensionContext canOpenURL:completionHandler:](self, "canOpenURL:completionHandler:", v10, v11);

}

void __52__SOHostExtensionContext_openURL_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v23 = *MEMORY[0x24BE382E0];
    v24[0] = CFSTR("com.apple.AppSSO.launch-origin");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v14 = 0;
    v6 = objc_msgSend(v4, "openSensitiveURL:withOptions:error:", v5, v3, &v14);
    v7 = v14;

    SO_LOG_SOHostExtensionContext();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("NO");
      v16 = 1752392040;
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 141558787;
      if ((_DWORD)v6)
        v9 = CFSTR("YES");
      v17 = 2117;
      v18 = v10;
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "opened URL %{sensitive, mask.hash}@: success = %{public}@, error = %{public}@", buf, 0x2Au);
    }

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v6);

  }
  else
  {
    SO_LOG_SOHostExtensionContext();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __52__SOHostExtensionContext_openURL_completionHandler___block_invoke_cold_1(a1, v12);

    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
  }
}

- (void)canOpenURL:(id)a3 completionHandler:(id)a4
{
  __CFString *v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  SOHostExtensionContext *v11;
  NSObject *v12;
  const __CFString *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  SOHostExtensionContext *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = (void (**)(id, uint64_t))a4;
  SO_LOG_SOHostExtensionContext();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v16 = (uint64_t)"-[SOHostExtensionContext canOpenURL:completionHandler:]";
    v17 = 2160;
    v18 = 1752392040;
    v19 = 2117;
    v20 = v6;
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_20DABC000, v8, OS_LOG_TYPE_DEFAULT, "%s URL: %{sensitive, mask.hash}@ on %@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v10 = objc_msgSend(v9, "isApplicationAvailableToOpenURL:error:", v6, &v14);
  v11 = (SOHostExtensionContext *)v14;

  SO_LOG_SOHostExtensionContext();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    *(_DWORD *)buf = 141558787;
    v16 = 1752392040;
    v17 = 2117;
    if ((_DWORD)v10)
      v13 = CFSTR("YES");
    v18 = (uint64_t)v6;
    v19 = 2114;
    v20 = v13;
    v21 = 2114;
    v22 = v11;
    _os_log_impl(&dword_20DABC000, v12, OS_LOG_TYPE_DEFAULT, "can open URL %{sensitive, mask.hash}@: result = %{public}@, error = %{public}@", buf, 0x2Au);
  }

  if (v7)
    v7[2](v7, v10);

}

- (void)presentAuthorizationViewControllerWithHints:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  SOHostExtensionContext *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  SO_LOG_SOHostExtensionContext();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[SOHostExtensionContext presentAuthorizationViewControllerWithHints:requestIdentifier:completion:]";
    v15 = 2114;
    v16 = v8;
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_20DABC000, v11, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", (uint8_t *)&v13, 0x20u);
  }

  -[SOHostExtensionContext contextExtension](self, "contextExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentAuthorizationViewControllerWithHints:requestIdentifier:completion:", v10, v8, v9);

}

- (void)authorization:(id)a3 didCompleteWithCredential:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  SOHostExtensionContext *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  SO_LOG_SOHostExtensionContext();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[SOHostExtensionContext authorization:didCompleteWithCredential:error:]";
    v15 = 2114;
    v16 = v8;
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_20DABC000, v11, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier: %{public}@ on %@", (uint8_t *)&v13, 0x20u);
  }

  -[SOHostExtensionContext contextExtension](self, "contextExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "authorization:didCompleteWithCredential:error:", v8, v10, v9);

}

- (void)requestReauthenticationWithRequestIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SOHostExtensionContext contextExtension](self, "contextExtension");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestReauthenticationWithRequestIdentifier:completion:", v7, v6);

}

- (SOExtension)contextExtension
{
  return (SOExtension *)objc_loadWeakRetained((id *)&self->_contextExtension);
}

- (void)setContextExtension:(id)a3
{
  objc_storeWeak((id *)&self->_contextExtension, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contextExtension);
}

void __49__SOHostExtensionContext_remoteContextWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20DABC000, a2, OS_LOG_TYPE_ERROR, "Error getting remote context %{public}@", (uint8_t *)&v2, 0xCu);
}

void __52__SOHostExtensionContext_openURL_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 141558275;
  v4 = 1752392040;
  v5 = 2117;
  v6 = v2;
  _os_log_error_impl(&dword_20DABC000, a2, OS_LOG_TYPE_ERROR, "can not open URL %{sensitive, mask.hash}@", (uint8_t *)&v3, 0x16u);
}

@end
