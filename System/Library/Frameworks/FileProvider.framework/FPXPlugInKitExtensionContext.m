@implementation FPXPlugInKitExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_25);
  return (id)_extensionAuxiliaryVendorProtocol_interface;
}

void __65__FPXPlugInKitExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  FPXVendorXPCInterface();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_1);
  return (id)_extensionAuxiliaryHostProtocol_interface;
}

void __63__FPXPlugInKitExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5D0358);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;

}

+ (void)setPrincipalClass:(Class)a3
{
  _FPXExtensionContextPrincipalClass = (uint64_t)a3;
}

+ (Class)principalClass
{
  return (Class)(id)_FPXExtensionContextPrincipalClass;
}

- (FPXPlugInKitExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  FPXPlugInKitExtensionContext *v11;
  FPXExtensionContext *v12;
  FPXExtensionContext *context;
  FPXExtensionContext *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FPXPlugInKitExtensionContext;
  v11 = -[FPXPlugInKitExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](&v20, sel_initWithInputItems_listenerEndpoint_contextUUID_, v8, v9, v10);
  if (v11)
  {
    v12 = objc_alloc_init(FPXExtensionContext);
    context = v11->_context;
    v11->_context = v12;

    v14 = v11->_context;
    -[FPXPlugInKitExtensionContext _auxiliaryConnection](v11, "_auxiliaryConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setExportedObject:", v14);

    location = 0;
    objc_initWeak(&location, v11);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__FPXPlugInKitExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke;
    v17[3] = &unk_1E44499C0;
    objc_copyWeak(&v18, &location);
    -[FPXPlugInKitExtensionContext _setRequestCleanUpBlock:](v11, "_setRequestCleanUpBlock:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __80__FPXPlugInKitExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "invalidate");
  }
  else
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __80__FPXPlugInKitExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_cold_1(v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

void __80__FPXPlugInKitExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleanup of extension context requested, but already deallocated", v1, 2u);
}

@end
