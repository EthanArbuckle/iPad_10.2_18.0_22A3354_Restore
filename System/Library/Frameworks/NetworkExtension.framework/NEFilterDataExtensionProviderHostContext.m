@implementation NEFilterDataExtensionProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_4070 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_4070, &__block_literal_global_4071);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_4072;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_4066 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_4066, &__block_literal_global_74_4067);
  return (id)_extensionAuxiliaryHostProtocol_protocol_4068;
}

void __75__NEFilterDataExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A748);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_4068;
  _extensionAuxiliaryHostProtocol_protocol_4068 = v0;

}

void __77__NEFilterDataExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A620);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_4072;
  _extensionAuxiliaryVendorProtocol_protocol_4072 = v0;

}

- (void)providerControlSocketFileHandle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerControlSocketFileHandle:", v4);

}

- (void)fetchProviderConnectionWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchProviderConnectionWithCompletionHandler:", v4);

}

- (void)handleRulesChanged
{
  id v2;

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleRulesChanged");

}

- (void)provideRemediationMap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provideRemediationMap:", v4);

}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provideURLAppendStringMap:", v4);

}

- (void)sendBrowserContentFilterServerRequest
{
  id v2;

  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendBrowserContentFilterServerRequest");

}

- (void)sendSocketContentFilterRequest
{
  id v2;

  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendSocketContentFilterRequest");

}

- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchCurrentRulesForFlow:completionHandler:", v7, v6);

}

- (void)report:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "report:", v4);

}

- (void)getSourceAppInfo:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = a3;
  +[NEAppInfoCache sharedAppInfoCache]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((id *)v6 + 2);
    v10 = (void *)*((_QWORD *)v6 + 3);
  }
  else
  {
    v9 = 0;
    v8 = 0;
    v10 = 0;
  }
  v11 = v10;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__NEFilterDataExtensionProviderHostContext_getSourceAppInfo_completionHandler___block_invoke;
  v13[3] = &unk_1E3CC03F0;
  v14 = v5;
  v12 = v5;
  -[NEAppInfoCache appInfoForPid:UUID:bundleID:completionHandler:](v7, v8, v9, v11, v13);

}

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySettings:completionHandler:", v7, v6);

}

uint64_t __79__NEFilterDataExtensionProviderHostContext_getSourceAppInfo_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
