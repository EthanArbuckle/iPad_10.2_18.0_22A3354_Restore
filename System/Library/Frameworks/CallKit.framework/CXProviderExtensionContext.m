@implementation CXProviderExtensionContext

- (id)remoteObjectProxy
{
  return -[CXProviderExtensionContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", 0);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CXProviderExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  else
    objc_msgSend(v5, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_4);
  return (id)_extensionAuxiliaryVendorProtocol_interface;
}

void __63__CXProviderExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "cx_providerVendorInterface");
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

void __61__CXProviderExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "cx_providerHostInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;

}

@end
