@implementation DDRemoteActionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[DDRemoteActionViewServiceContext _extensionAuxiliaryVendorProtocol](DDRemoteActionViewServiceContext, "_extensionAuxiliaryVendorProtocol");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[DDRemoteActionViewServiceContext _extensionAuxiliaryHostProtocol](DDRemoteActionViewServiceContext, "_extensionAuxiliaryHostProtocol");
}

- (id)protocolService
{
  void *v2;
  void *v3;

  -[DDRemoteActionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __44__DDRemoteActionHostContext_protocolService__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __44__DDRemoteActionHostContext_protocolService__block_invoke_cold_1(a2);
}

+ (id)_allowedItemPayloadClasses
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
}

- (void)prepareViewControllerWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  -[DDRemoteActionHostContext protocolService](self, "protocolService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__DDRemoteActionHostContext_prepareViewControllerWithContext_completionHandler___block_invoke;
    v9[3] = &unk_1E42581D8;
    v10 = v7;
    objc_msgSend(v8, "prepareViewControllerWithContext:completionHandler:", v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, double, double))v7 + 2))(v7, 0, 0.0, 0.0);
  }

}

void __80__DDRemoteActionHostContext_prepareViewControllerWithContext_completionHandler___block_invoke(uint64_t a1, char a2, double a3, double a4)
{
  _QWORD v7[4];
  id v8;
  double v9;
  double v10;
  char v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__DDRemoteActionHostContext_prepareViewControllerWithContext_completionHandler___block_invoke_2;
  v7[3] = &unk_1E42581B0;
  v8 = *(id *)(a1 + 32);
  v9 = a3;
  v10 = a4;
  v11 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __80__DDRemoteActionHostContext_prepareViewControllerWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)enableUserInteraction:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DDRemoteActionHostContext protocolService](self, "protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableUserInteraction:", v3);

}

void __44__DDRemoteActionHostContext_protocolService__block_invoke_cold_1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error calling service - %@", (uint8_t *)&v2, 0xCu);

}

@end
