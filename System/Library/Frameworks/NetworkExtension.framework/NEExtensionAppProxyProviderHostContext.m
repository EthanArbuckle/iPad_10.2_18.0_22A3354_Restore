@implementation NEExtensionAppProxyProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_1940 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_1940, &__block_literal_global_1941);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_1942;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_1936 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_1936, &__block_literal_global_68_1937);
  return (id)_extensionAuxiliaryHostProtocol_protocol_1938;
}

void __73__NEExtensionAppProxyProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE418B90);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_1938;
  _extensionAuxiliaryHostProtocol_protocol_1938 = v0;

}

void __75__NEExtensionAppProxyProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE418AF8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_1942;
  _extensionAuxiliaryVendorProtocol_protocol_1942 = v0;

}

- (void)setInitialFlowDivertControlSocket:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInitialFlowDivertControlSocket:", v4);

}

- (void)setDelegateInterface:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegateInterface:", v3);

}

- (void)openFlowDivertControlSocketWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extension:didRequestFlowDivertControlSocketWithCompletionHandler:", self, v4);

}

- (int)requiredEntitlement
{
  return 2;
}

@end
