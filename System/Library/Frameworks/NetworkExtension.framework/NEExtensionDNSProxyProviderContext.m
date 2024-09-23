@implementation NEExtensionDNSProxyProviderContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2098 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2098, &__block_literal_global_2099);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2100;
}

void __71__NEExtensionDNSProxyProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE419A38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2100;
  _extensionAuxiliaryVendorProtocol_protocol_2100 = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol_protocol_2100, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_setSystemDNSSettings_, 0, 0);

}

- (void)setSystemDNSSettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemDNSSettings:", v4);

}

- (id)extensionPoint
{
  return CFSTR("com.apple.networkextension.dns-proxy");
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

@end
