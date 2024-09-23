@implementation FPUIActionExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[FPUIActionRemoteContext _extensionAuxiliaryVendorProtocol](FPUIActionRemoteContext, "_extensionAuxiliaryVendorProtocol");
}

- (void)completeRequest
{
  -[FPUIActionExtensionContext completeRequestWithUserInfo:](self, "completeRequestWithUserInfo:", 0);
}

- (void)completeRequestWithUserInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FPUIActionExtensionContext _remoteContext](self, "_remoteContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_completeRequestWithUserInfo:error:", v4, 0);

}

- (void)cancelRequestWithError:(NSError *)error
{
  NSError *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = error;
  -[FPUIActionExtensionContext setSetupError:](self, "setSetupError:", v4);
  -[FPUIActionExtensionContext _remoteContext](self, "_remoteContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSError fp_strippedError](v4, "fp_strippedError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_completeRequestWithUserInfo:error:", 0, v6);

  v7.receiver = self;
  v7.super_class = (Class)FPUIActionExtensionContext;
  -[FPUIActionExtensionContext cancelRequestWithError:](&v7, sel_cancelRequestWithError_, v4);

}

- (void)didEncounterError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[FPUIActionExtensionContext setSetupError:](self, "setSetupError:", v7);
  -[FPUIActionExtensionContext _remoteContext](self, "_remoteContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fp_strippedError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_didEncounterError:completionHandler:", v8, v6);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[FPUIActionRemoteContext _extensionAuxiliaryHostProtocol](FPUIActionRemoteContext, "_extensionAuxiliaryHostProtocol");
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FPUIActionExtensionContext _remoteContext](self, "_remoteContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__FPUIActionExtensionContext_openURL_completionHandler___block_invoke;
  v10[3] = &unk_24EFEE390;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "_openExtensionURL:completionHandler:", v7, v10);

}

void __56__FPUIActionExtensionContext_openURL_completionHandler___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__FPUIActionExtensionContext_openURL_completionHandler___block_invoke_2;
  v3[3] = &unk_24EFEE0D0;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __56__FPUIActionExtensionContext_openURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (id)_remoteContext
{
  void *v2;
  void *v3;

  -[FPUIActionExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __44__FPUIActionExtensionContext__remoteContext__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = fpuiLogHandle;
  if (!fpuiLogHandle)
  {
    FPUIInitLogging();
    v3 = fpuiLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__FPUIActionExtensionContext__remoteContext__block_invoke_cold_1((uint64_t)v2, v3);

}

- (NSFileProviderDomainIdentifier)domainIdentifier
{
  return (NSFileProviderDomainIdentifier)objc_getProperty(self, a2, 24, 1);
}

- (void)setDomainIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSURL)initialURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInitialURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSError)setupError
{
  return self->_setupError;
}

- (void)setSetupError:(id)a3
{
  objc_storeStrong((id *)&self->_setupError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupError, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

void __44__FPUIActionExtensionContext__remoteContext__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2278C8000, a2, OS_LOG_TYPE_ERROR, "Remote context proxy failed with error (%@)", (uint8_t *)&v2, 0xCu);
}

@end
