@implementation NEFilterExtensionProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_4705 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_4705, &__block_literal_global_4706);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_4707;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_4701 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_4701, &__block_literal_global_62_4702);
  return (id)_extensionAuxiliaryHostProtocol_protocol_4703;
}

void __71__NEFilterExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A1E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_4703;
  _extensionAuxiliaryHostProtocol_protocol_4703 = v0;

}

void __73__NEFilterExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A188);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_4707;
  _extensionAuxiliaryVendorProtocol_protocol_4707 = v0;

}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startFilterWithOptions:completionHandler:", v7, v6);

}

- (int)requiredEntitlement
{
  return 4;
}

@end
