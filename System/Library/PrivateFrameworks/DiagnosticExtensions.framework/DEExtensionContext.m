@implementation DEExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_8);
  return (id)_extensionAuxiliaryVendorProtocol___interface_0;
}

void __55__DEExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE790F80);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  _extensionAuxiliaryVendorProtocol___interface_0 = v0;

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_93);
  return (id)_extensionAuxiliaryHostProtocol___interface_0;
}

void __53__DEExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78F4C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface_0;
  _extensionAuxiliaryHostProtocol___interface_0 = v0;

}

- (BOOL)hasEntitlement
{
  void *v2;
  void *v3;

  -[DEExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.DiagnosticExtensions.extensionHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (void)attachmentListWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  if (-[DEExtensionContext hasEntitlement](self, "hasEntitlement"))
  {
    -[DEExtensionContext _principalObject](self, "_principalObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachmentList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
  else
  {
    v6[2](v6, 0);
  }

}

- (void)attachmentsForParameters:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id location;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (-[DEExtensionContext hasEntitlement](self, "hasEntitlement"))
  {
    -[DEExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "processIdentifier");

    objc_initWeak(&location, self);
    -[DEExtensionContext _principalObject](self, "_principalObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__DEExtensionContext_attachmentsForParameters_withHandler___block_invoke;
    v20[3] = &unk_1E4E35908;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v10, "attachmentsForParameters:withProgressHandler:", v6, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "_generateSandboxExtensionTokenForPID:", v9, (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      }
      while (v13);
    }

    v7[2](v7, v12);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v7[2](v7, 0);
  }

}

void __59__DEExtensionContext_attachmentsForParameters_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_99);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "collectionDidUpdateWithProgress:", v3);
}

void __59__DEExtensionContext_attachmentsForParameters_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __59__DEExtensionContext_attachmentsForParameters_withHandler___block_invoke_2_cold_1(v2, v3);

}

- (void)setupWithParameters:(id)a3 withHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[DEExtensionContext hasEntitlement](self, "hasEntitlement"))
  {
    -[DEExtensionContext _principalObject](self, "_principalObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setupWithParameters:", v8);

    v6[2](v6);
  }

}

- (void)teardownWithParameters:(id)a3 withHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[DEExtensionContext hasEntitlement](self, "hasEntitlement"))
  {
    -[DEExtensionContext _principalObject](self, "_principalObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "teardownWithParameters:", v8);

    v6[2](v6);
  }

}

- (void)isExtensionEnhancedLoggingStateOnWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[DEExtensionContext hasEntitlement](self, "hasEntitlement"))
  {
    -[DEExtensionContext _principalObject](self, "_principalObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isExtensionEnhancedLoggingStateOnWithHandler:", v5);

  }
}

void __59__DEExtensionContext_attachmentsForParameters_withHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A4EEE000, a2, OS_LOG_TYPE_ERROR, "error calling collectionDidUpdateWithProgress - %@", (uint8_t *)&v4, 0xCu);

}

@end
